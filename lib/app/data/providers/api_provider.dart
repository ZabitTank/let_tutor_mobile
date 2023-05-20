import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:let_tutor_mobile/core/utils/secure_storage.dart';
import 'package:let_tutor_mobile/core/values/backend_enviroment.dart';
import 'package:let_tutor_mobile/core/values/exceptions/bussiness_exception.dart';
import 'package:let_tutor_mobile/core/values/exceptions/unexpected_exception.dart';

class RestAPIProvider {
  static late final Dio client;

  static RestAPIProvider get instance => _singleton;

  factory RestAPIProvider() {
    return _singleton;
  }

  static final RestAPIProvider _singleton = RestAPIProvider._internal();

  RestAPIProvider._internal() {
    client = Dio();
  }

  static String buildQueryString(
      {Map<String, dynamic>? queryParams, String? path}) {
    final encodedQueryParams = <String, dynamic>{};

    queryParams?.forEach((key, value) {
      if (value != null) {
        if (value is List) {
          encodedQueryParams[key] =
              List<String>.from(value.map((item) => "$key[]=$item"));
        } else {
          encodedQueryParams[key] = value.toString();
        }
      }
    });

    final uri = Uri(
      scheme: 'https',
      host: 'sandbox.api.lettutor.com',
      path: path,
      queryParameters: encodedQueryParams,
    );

    return uri.toString();
  }

  // new
  Future<Response> request({
    required String endpoint,
    required HttpMethod method,
    var body,
    bool useToken = false,
    bool useTokenId = false,
    Map<String, dynamic>? query,
  }) async {
    try {
      Response response = await _handleCallRequest(
          method, endpoint, body, query, useToken, useTokenId);

      return await _handleProcessResponse(
          response, method, endpoint, body, query,
          isUseTokenId: useTokenId, autoRecall: true);
    } catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow;
    }
  }

  Future<Response> _handleCallRequest(
      HttpMethod method,
      String endpoint,
      var body,
      Map<String, dynamic>? query,
      bool useToken,
      bool useIdToken) async {
    try {
      var requestBody = (body == null ? null : json.encode(body));

      final option = Options(
        validateStatus: (status) {
          return status! < 600;
        },
        headers: await _buildHeader(useToken: useToken, useIdToken: useIdToken),
      );
      switch (method) {
        case HttpMethod.GET:
          return await client.get(
            endpoint,
            data: requestBody,
            queryParameters: query,
            options: option,
          );

        case HttpMethod.PUT:
          return await client.put(
            endpoint,
            data: requestBody,
            queryParameters: query,
            options: option,
          );
        case HttpMethod.POST:
          return await client.post(
            endpoint,
            data: requestBody,
            queryParameters: query,
            options: option,
          );
      }
    } catch (e) {
      return Future.error(
        UnexpectedException(
          context: "BaseRequest/${method.name}",
          debugMessage: e.toString(),
        ),
      );
    }
  }

  Future<Response> _handleProcessResponse(
    Response response,
    HttpMethod method,
    String endpoint,
    body,
    Map<String, dynamic>? query, {
    required bool isUseTokenId,
    bool autoRecall = false,
  }) async {
    // Unauthorize -> refreshToken
    if (response.statusCode == 401) {
      if (autoRecall) {
        refreshToken();

        Response response = await _handleCallRequest(
            method, endpoint, body, query, true, isUseTokenId);
        return await _handleProcessResponse(
            response, method, endpoint, body, query,
            isUseTokenId: true, autoRecall: false);
      } else {
        Future.error(
          UnauthorizeException(
            context: endpoint,
            debugMessage: response.data['message'],
          ),
        );
      }
    }

    // handle other error
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response;
    } else {
      if (response.statusCode == 500) {
        return Future.error(
          BackendException(
              endpoint: endpoint,
              debugMessage: "Backend Error: ${response.statusMessage}"),
        );
      } else {
        final errorMessage = response.data['message'];
        return Future.error(
          IBussinessException(
              context: endpoint,
              debugMessage: errorMessage,
              message: errorMessage),
        );
      }
    }
  }

  Future<void> refreshToken() async {
    final refreshToken = await SecureStorage.getRefreshToken();
    var body = {'refreshToken': refreshToken, "timezone": 7};

    Response response = await post(
        endpoint: "${BackendEnviroment.letTutorUrl}/auth/refresh-token",
        body: body);

    if (response.statusCode == 200) {
      await SecureStorage.storeAccessToken(
          response.data['tokens']['access']['token']);
      await SecureStorage.storeAccessToken(
          response.data['tokens']['refresh']['token']);
    } else {
      Future.error(RefreshTokenException);
    }
  }

  // old
  Future<Response> post({
    required String endpoint,
    var body,
    bool useToken = false,
    bool useIdToken = false,
    Map<String, dynamic>? query,
  }) async {
    Response response = await client.post(endpoint,
        data: json.encode(body),
        queryParameters: query,
        options: Options(
          headers: await _buildHeader(useToken: useToken, useIdToken: true),
          validateStatus: (status) => status! < 500,
        ));

    return response;
  }

  Future<Response> get({
    required String endpoint,
    dynamic body,
    bool useToken = false,
    bool useIdToken = false,
    Map<String, dynamic>? query,
  }) async {
    var requestBody = (body == null ? null : json.encode(body));

    Response response = await client.get(
      endpoint,
      queryParameters: query,
      data: requestBody,
      options: Options(
        headers: await _buildHeader(useToken: useToken, useIdToken: useToken),
        validateStatus: (status) => status! < 500,
      ),
    );
    return response;
  }

  Future<Response> put({
    required String endpoint,
    body,
    bool useToken = false,
    bool useIdToken = false,
    Map<String, dynamic>? query,
  }) async {
    Response response = await client.put(
      endpoint,
      queryParameters: query,
      data: json.encode(body),
      options: Options(
        headers: await _buildHeader(useToken: useToken, useIdToken: useIdToken),
        validateStatus: (status) => status! < 500,
      ),
    );

    return response;
  }

  Future<Response<dynamic>> _handleRefreshToken(HttpMethod method,
      String endpoint, body, Map<String, dynamic>? query, bool useToken) async {
    await refreshToken();
    switch (method) {
      case HttpMethod.GET:
        return await client.get(
          endpoint,
          data: json.encode(body),
          queryParameters: query,
          options: Options(
            headers: await _buildHeader(useToken: useToken),
          ),
        );
      case HttpMethod.PUT:
        return await client.put(
          endpoint,
          data: json.encode(body),
          queryParameters: query,
          options: Options(
            headers: await _buildHeader(useToken: useToken),
          ),
        );
      case HttpMethod.POST:
        return await client.post(
          endpoint,
          data: json.encode(body),
          queryParameters: query,
          options: Options(
            headers: await _buildHeader(useToken: useToken),
          ),
        );
    }
  }

  Future<Map<String, String>> _buildHeader({
    bool useToken = false,
    bool useIdToken = false,
  }) async {
    var baseHeader = {
      HttpHeaders.dateHeader: DateTime.now().millisecondsSinceEpoch.toString(),
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      "device": "app"
    };
    baseHeader["X-Api-Key"] = "ApplicationKey";

    if (useToken) {
      String? token = !useIdToken
          ? await SecureStorage.getAccessToken()
          : await SecureStorage.getIdToken();
      if (token != null && token != "") {
        baseHeader["Authorization"] = "Bearer $token";
      }
    }
    return baseHeader;
  }

  static Uri buildUrlWithQuery(String endpoint, Map<String, dynamic> query) {
    return query.isEmpty
        ? Uri.parse(endpoint).replace(queryParameters: query)
        : Uri.parse(endpoint);
  }
}

enum HttpMethod {
  GET,
  PUT,
  POST,
}

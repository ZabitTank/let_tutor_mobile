import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/user_info.dart';
import 'package:let_tutor_mobile/app/data/providers/api_provider.dart';
import 'package:let_tutor_mobile/core/utils/secure_storage.dart';
import 'package:let_tutor_mobile/core/values/exceptions/bussiness_exception.dart';
import 'package:let_tutor_mobile/core/values/exceptions/unexpected_exception.dart';

class UserAPIService {
  final String domain;
  UserAPIService(this.domain);

  Future<void> forgotPasswod({required String email}) async {
    try {
      await RestAPIProvider.instance.request(
          body: {"email": email},
          endpoint: domain + UserAPIPath.forgotPassword,
          method: HttpMethod.POST,
          useToken: true);
    } on IBussinessException catch (_) {
      rethrow;
    } on UnexpectedException catch (_) {
      rethrow;
    } catch (e) {
      return Future.error(ServiceLogicException(
          context: "User/getMe/", debugMessage: e.toString()));
    }
  }

  Future<MyUserInfo> getMe() async {
    try {
      final response = await RestAPIProvider.instance.request(
          endpoint: domain + UserAPIPath.info,
          method: HttpMethod.GET,
          useToken: true);

      return MyUserInfo.fromJson(response.data['user']);
    } on IBussinessException catch (_) {
      rethrow;
    } on UnexpectedException catch (_) {
      rethrow;
    } catch (e) {
      return Future.error(ServiceLogicException(
          context: "User/getMe/", debugMessage: e.toString()));
    }
  }

  Future<MyUserInfo> updateInfo({
    required String name,
    required String level,
    String? country,
    String? birthday,
    List<int>? learnTopics,
    List<int>? testPreparations,
  }) async {
    try {
      var body = {
        "name": name,
        "level": level,
        "country": country,
        "birthday": birthday,
        "learnTopics": learnTopics,
        "testPreparations": testPreparations,
      };

      final response = await RestAPIProvider.instance.request(
          endpoint: domain + UserAPIPath.info,
          body: body,
          method: HttpMethod.PUT,
          useToken: true);

      return MyUserInfo.fromJson(response.data['user']);
    } on IBussinessException catch (_) {
      rethrow;
    } on UnexpectedException catch (_) {
      rethrow;
    } catch (e) {
      return Future.error(ServiceLogicException(
          context: "User/updateInfo/", debugMessage: e.toString()));
    }
  }

  Future<MyUserInfo> uploadAvatar(XFile avatar) async {
    try {
      FormData formData = FormData();
      formData.files.add(MapEntry(
        'avatar',
        await MultipartFile.fromFile(
          avatar.path,
        ),
      ));
      Response response = await RestAPIProvider.client.post(
          'https://sandbox.api.lettutor.com/user/uploadAvatar',
          data: formData,
          options: Options(headers: {
            "Authorization": "Bearer ${await SecureStorage.getAccessToken()}"
          }));

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return MyUserInfo.fromJson(response.data);
      } else {
        return Future.error(const ServiceLogicException(
            context: "implement", debugMessage: ""));
      }
    } catch (e) {
      return Future.error(ServiceLogicException(
          context: "Auth/uploadAvatar/", debugMessage: e.toString()));
    }
  }

  Future<void> addFavoriteTutor(String tutorId) async {
    try {
      final requestBody = {"tutorId": tutorId};

      await RestAPIProvider.instance.request(
          endpoint: "$domain${UserAPIPath.favorite}",
          method: HttpMethod.POST,
          body: requestBody,
          useToken: true);

      print("jaja");
    } catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow;
    }
  }
}

class UserAPIPath {
  static const String info = "/info"; // get
  static const String forgotPassword = "/forgotPassword";
  static const String search = "/search";
  static const String feedbackTutor = "/feedbackTutor";
  static const String favorite = "/manageFavoriteTutor";
}

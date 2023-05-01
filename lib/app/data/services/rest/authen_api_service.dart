import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/login_response.dart';
import 'package:let_tutor_mobile/app/data/providers/api_provider.dart';
import 'package:let_tutor_mobile/core/utils/secure_storage.dart';
import 'package:let_tutor_mobile/core/values/exceptions/bussiness_exception.dart';
import 'package:let_tutor_mobile/core/values/exceptions/unexpected_exception.dart';

class AuthenAPIService {
  final String authDomain;
  final String verifyDomain;

  AuthenAPIService(this.authDomain, this.verifyDomain);

  Future<LoginResponse> login(
      {required String email,
      required String password,
      String? phone,
      bool isUsingPhone = false}) async {
    try {
      var requestBody = {"email": email, "password": password};

      if (isUsingPhone) {
        requestBody = {"phone": phone!, "password": password};
      }

      final response = await RestAPIProvider.instance.request(
          body: requestBody,
          endpoint: authDomain +
              (!isUsingPhone
                  ? AuthenAPIPaths.login
                  : AuthenAPIPaths.loginByPhone),
          method: HttpMethod.POST);

      return await _handleLoginResponse(response);
    } on IBussinessException catch (_) {
      rethrow;
    } on UnexpectedException catch (_) {
      rethrow;
    } catch (e) {
      return Future.error(ServiceLogicException(
          context: "Auth/login", debugMessage: e.toString()));
    }
  }

  Future<LoginResponse> loginByGoogle() async {
    try {
      await GoogleSignIn().signOut();
    } catch (_) {}
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn(
        scopes: [
          'https://www.googleapis.com/auth/userinfo.email',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
      ).signIn();

      if (gUser == null) {
        return Future.error(
            const CancelActionException(message: "Cancel Google Signin"));
      }
      // obtain auth detail from request
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // create a new credential for user
      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      final body = {
        "access_token": credential.accessToken,
      };

      final response = await RestAPIProvider.instance.request(
          method: HttpMethod.POST,
          endpoint: authDomain + AuthenAPIPaths.loginByGoogle,
          body: body);

      return await _handleLoginResponse(response);
    } on PlatformException catch (e) {
      return Future.error(UnexpectedException(
          context: "Auth/Google Login", debugMessage: e.toString()));
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse> _handleLoginResponse(Response response) async {
    final responseBody = LoginResponse.fromJson(response.data);
    await SecureStorage.storeAllIdentity(
      accesstoken: responseBody.tokens.access.token,
      refreshToken: responseBody.tokens.refresh.token,
    );

    return responseBody;
  }

  Future<void> googleSignout() async {
    try {
      await GoogleSignIn().signOut();
    } catch (e) {
      return Future.error(UnexpectedException(
          context: "Auth/Logout-google", debugMessage: e.toString()));
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      String? phone,
      bool isUsingPhone = false}) async {
    try {
      var requestBody = {
        "email": email,
        "password": password,
      };

      if (isUsingPhone) {
        requestBody = {
          "phone": phone!,
          "password": password,
        };
      }
      await RestAPIProvider.instance.request(
          body: requestBody,
          endpoint: authDomain +
              (!isUsingPhone
                  ? AuthenAPIPaths.register
                  : AuthenAPIPaths.registerByPhone),
          method: HttpMethod.POST);
    } on IBussinessException catch (_) {
      rethrow;
    } on UnexpectedException catch (_) {
      rethrow;
    } catch (e) {
      return Future.error(ServiceLogicException(
          context: "Auth/register", debugMessage: e.toString()));
    }
  }

  Future<void> changePassword(
      {required String newPassword, required String oldPassword}) async {
    try {
      var body = {"password": oldPassword, "newPassword": newPassword};
      await RestAPIProvider.instance.request(
          endpoint: authDomain + AuthenAPIPaths.changePassword,
          method: HttpMethod.POST,
          body: body);
    } catch (e) {
      rethrow;
    }
  }
}

class AuthenAPIPaths {
  static const String login = "/login";
  static const String loginByPhone = "/phone-login";
  static const String loginByGoogle = "/google";

  static const String register = "/register";
  static const String registerByPhone = "/phone-register";
  static const String changePassword = "/change-password";
  static const String verifyEmail = "/verifyAccount";

  // what the ...
  static const String notAuthButAuth1 = "/phone-auth-verify/activate";
  static const String notAuthButAuth2 = "/phone-auth-verify/create";
}

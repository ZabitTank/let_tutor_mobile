import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/user_info.dart';
import 'package:let_tutor_mobile/app/data/providers/api_provider.dart';
import 'package:let_tutor_mobile/core/values/exceptions/bussiness_exception.dart';
import 'package:let_tutor_mobile/core/values/exceptions/unexpected_exception.dart';

class UserAPIService {
  final String domain;

  Future<MyUserInfo> getMe() async {
    try {
      final response = await RestAPIProvider.instance.request(
          endpoint: domain + UserAPIPath.info,
          method: HttpMethod.GET,
          useToken: true);

      return MyUserInfo.fromJson(response.data);
    } on IBussinessException catch (_) {
      rethrow;
    } on UnexpectedException catch (_) {
      rethrow;
    } catch (e) {
      return Future.error(ServiceLogicException(
          context: "Auth/getMe/", debugMessage: e.toString()));
    }
  }

  UserAPIService(this.domain);
}

class UserAPIPath {
  static const String info = "/info"; // get
  static const String getList = "/forgotPassword";
  static const String search = "/search";
  static const String feedbackTutor = "/feedbackTutor";
  static const String favorite = "/manageFavoriteTutor";
}

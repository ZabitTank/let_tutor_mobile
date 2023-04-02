import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';

class UnexpectedException implements Exception {
  const UnexpectedException(
      {this.debugMessage = "Unexprected exception",
      this.context = "unknown",
      this.message = CommonString.errorContactowner});

  final String message;
  final String? debugMessage;
  final String? context;

  @override
  String toString() {
    debugPrint('Error/$context/$debugMessage');
    return message;
  }

  static Future<void> handleFatalException(UnexpectedException e) async {
    if (e is RefreshTokenException) {
      debugPrint(e.toString());
      showSnackBar("Error", e.message);
      await Get.find<AppStateController>().logout();
    }
  }
}

class RefreshTokenException extends UnexpectedException {
  const RefreshTokenException(
      {String? debugMessage = "Failed to refresh token! Force Logout",
      String? context})
      : super(debugMessage: debugMessage, context: context);
}

class ServiceLogicException extends UnexpectedException {
  const ServiceLogicException({
    required String? context,
    String? debugMessage = "Error occur when mapping response body to object",
  }) : super(debugMessage: debugMessage, context: "frontend/service/$context");
}

class BackendException extends UnexpectedException {
  const BackendException(
      {String? debugMessage =
          "Error occur when mapping response body to object",
      required String endpoint})
      : super(debugMessage: debugMessage, context: "Backend/$endpoint");
}

import 'package:flutter/material.dart';
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

  // static Future<void> handleFatalException(Object e) async {
  //   if (e is RefreshTokenException) {
  //     await Get.find<LifeCycleController>().logout();
  //   }
  // }
}

class RefreshTokenException extends UnexpectedException {
  const RefreshTokenException(
      {String? debugMessage = "Failed to refresh token! Force Logout",
      String? context})
      : super(debugMessage: debugMessage, context: context);
}

class PasrseException extends UnexpectedException {
  const PasrseException({
    String? debugMessage = "Error occur when mapping response body to object",
  }) : super(debugMessage: debugMessage, context: "frontend/service");
}

class BackendException extends UnexpectedException {
  const BackendException(
      {String? debugMessage =
          "Error occur when mapping response body to object",
      required String endpoint})
      : super(debugMessage: debugMessage, context: "Backend/$endpoint");
}

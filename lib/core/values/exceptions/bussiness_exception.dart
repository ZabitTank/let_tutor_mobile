import 'package:flutter/material.dart';

class IBussinessException implements Exception {
  const IBussinessException({
    this.message = 'Bussiness Logic Exception',
    this.debugMessage = "unknown message",
    this.context = "unknown",
  });

  final String message;
  final String? debugMessage;
  final String? context;

  @override
  String toString() {
    debugPrint('Frontend-API-Failed/$context/$debugMessage');
    return message;
  }
}

class AccountNotActiveException extends IBussinessException {
  const AccountNotActiveException(String accountId,
      {String message = "Account Not Active", String? context})
      : super(
            message: message,
            debugMessage: "This $accountId not active",
            context: context);
}
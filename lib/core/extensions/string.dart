import 'package:get/get.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';

final regExpPhoneNumber = RegExp(r"^(?:\+88||01)?(?:\d{10}|\d{13})$");

final regExpEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

// final regExpStrongPassword = RegExp(r"^(?:\+88||01)?(?:\d{10}|\d{13})$");

extension StringValidation on String {
  bool get isPhoneNumber {
    return regExpPhoneNumber.hasMatch(this);
  }

  bool get isStrongPassword {
    return length >= 6;
  }

  bool get isEmail {
    return regExpEmail.hasMatch(this);
  }
}

extension LocalLizaTionTr on LocalizationKeys {
  String get tr {
    return name.tr;
  }
}

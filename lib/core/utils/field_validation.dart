class FieldValidator {
  static String? phoneNumberValidation(String value) {
    if (value.isEmpty) {
      return "This field must be filled";
    } else if (!value.isPhoneNumber) {
      return "You must enter a right phone number";
    }
    return null;
  }

  static String? passwordFieldValidation(String value) {
    if (value.isEmpty) {
      return "This field must be filled";
    } else if (!value.isStrongPassword) {
      return "Password must be at least 6 characters";
    }
    return null;
  }
}

final regExpPhoneNumber = RegExp(r"^(?:\+88||01)?(?:\d{10}|\d{13})$");
// final regExpStrongPassword = RegExp(r"^(?:\+88||01)?(?:\d{10}|\d{13})$");

extension StringValidation on String {
  bool get isPhoneNumber {
    return regExpPhoneNumber.hasMatch(this);
  }

  bool get isStrongPassword {
    return length >= 6;
  }
}

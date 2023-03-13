import 'package:let_tutor_mobile/core/extensions/string.dart';

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

  static String? nameValidator(String value) {
    if (value.isEmpty) {
      return "This field must be filled";
    }
    return RegExp(r'^[a-z A-Z,.\-]+$',
                caseSensitive: false, unicode: true, dotAll: true)
            .hasMatch(value)
        ? null
        : "Name can't contains special characters or number";
  }

  static String? emailValidator(String value) {
    if (value.isEmpty) {
      return "This field must be filled";
    } else if (!value.isEmail) {
      return "You must enter a email address";
    }
    return null;
  }

  static String? idValidator(String value) {
    if (value.isEmpty) {
      return "This field must be filled";
    }
    return value.length >= 12 ? null : "ID length can't be lower than 12";
  }

  static String? addressValidator(String value) {
    if (value.isEmpty) {
      return "This field must be filled";
    }
    return null;
  }

  static String? passwordValidator(String value) {
    if (value.isEmpty) {
      return "This field is required";
    } else if (value.length < 6) {
      return "Password length must be longer than 6 digits";
    }
    return null;
  }

  static String? otpValidator(String text) {
    if (text.isEmpty) {
      return "OTP can't be empty";
    } else if (text.length < 6) {
      return "Please fill all the numbers";
    }
    return null;
  }

  static String? phoneNumberValidator(String value) {
    if (value.isEmpty) {
      return "This field is required";
    } else if (!value.isPhoneNumber) {
      return "This is a valid phone number";
    }
    return null;
  }

  static String? driverLicenseValidator(String value) {
    if (value.isEmpty) {
      return "This field must be filled";
    }
    return value.length >= 12 ? null : "ID length can't be lower than 12";
  }

  static String? ownerNameValidator(String value) {
    if (value.isEmpty) {
      return "This field must be filled";
    }
    return RegExp(r'^[a-z A-Z,.\-]+$',
                caseSensitive: false, unicode: true, dotAll: true)
            .hasMatch(value)
        ? null
        : "Name can't contains special characters or number";
  }

  static String? numberPlateValidator(String value) {
    if (value.isEmpty) return "This field must be filled";

    return value.length < 6 ? "Please enter a real number plate" : null;
  }

  static String? vehicleBrandValidator(String value) {
    if (value.isEmpty) return "This field must be filled";

    return null;
  }

  static String? vehicleTypeValidator(String value) {
    if (value.isEmpty) return "This field must be filled";

    return null;
  }

  static String? messageValidator(String value) {
    if (value.isEmpty) {
      return "This field must be filled";
    }
    return null;
  }
}

import 'package:hive/hive.dart';

part 'enum.g.dart';

enum TokenType {
  accessToken,
  refreshToken,
  apiToken,
}

// screen - content1 - object
enum LocalizationKeys {
  login1TitleText,
  login1SubTitleText,
  login2UserUserNameText,
  login2UserNameHintTextField,

  login2UserPasswordText,
  login2ErrorLoginText,
  login3OtherSignupText,
  login3ForgotPasswordHightLightText,

  login3OtherSignupHightLightText,
}

@HiveType(typeId: 0)
enum LocalizationCode {
  @HiveField(0)
  vietnam("vi-VN"),
  @HiveField(1)
  english("en-US");

  final String codename;

  const LocalizationCode(this.codename);
}

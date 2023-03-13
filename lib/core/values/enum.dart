import 'package:hive/hive.dart';

part 'enum.g.dart';

enum TokenType {
  accessToken,
  refreshToken,
  apiToken,
}

// screen - content1 - object
enum LocalizationKeys {
  currentLanguages,
  englishLocales,
  vietnamLocales,

  login1TitleText,
  login1SubTitleText,
  login2UserUserNameText,
  login2UserNameHintTextField,

  login2UserPasswordText,
  login2ErrorLoginText,
  login3OtherSignupText,
  login3ForgotPasswordHightLightText,

  login3OtherSignupHightLightText,

  settingscreen_appbar,
  settingscreen_section_common,
  settingscreen_section_common_language,
  settingscreen_section_common_theme,
  settingscreen_section_gpt_key,
  settingscreen_section_gpt_use_system_key,
  settingscreen_section_gpt_use_your_key,
  settingscreen_section_gpt,
  settingscreen_section_auto_voice,
  settingscreen_section_gpt_delete,
  settingscreen_section_gpt_delete_confirm,
  settingscreen_section_chatlog,
}

@HiveType(typeId: 0)
enum LocalizationCode {
  @HiveField(0)
  vietnam("vi"),
  @HiveField(1)
  english("en");

  final String codename;

  const LocalizationCode(this.codename);
}

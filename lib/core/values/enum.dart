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

  //tutors screen
  tutorscreen_incoming_course_textfield,
  tutorscreen_start_course_section,
  tutorscreen_total_hours_leared_textfield,

  tutorscreen_find_tutors_textfield,
  tutorscreen_find_tutors_filter_name_hint,
  tutorscreen_find_tutors_filter_nation_hint,

  tutorscreen_find_datime_section_textfield,
  tutorscreen_find_date__textfield,
  tutorscreen_find_time_start_filter_hint,
  tutorscreen_find_time_end_filter_hint,

  tutorscreen_reset_filter_textfield,

  tutorscreen_recommended_tutor_textfield,

  tutorscreen_booked_button,

  // seting screen
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

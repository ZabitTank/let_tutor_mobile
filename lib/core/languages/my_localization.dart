import 'package:let_tutor_mobile/core/languages/_en.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';

class MyLocalization {
  static LocalizationCode defaultLanguage = LocalizationCode.english;

  static const Map<LocalizationCode, Map<LocalizationKeys, String>>
      _localizedValues = {
    LocalizationCode.english: en,
    LocalizationCode.vietnam: {}
  };

  static set language(LocalizationCode? lang) {
    defaultLanguage = lang ?? LocalizationCode.english;
  }

  static String translate(LocalizationKeys key) {
    return _localizedValues[defaultLanguage]?[key] ?? "undefined";
  }
}

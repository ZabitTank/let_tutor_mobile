import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/core/languages/_en.dart';
import 'package:let_tutor_mobile/core/languages/_vi.dart';

class MyLocalization extends Translations {
  // locale sẽ được get mỗi khi mới mở app (có thể cache lại locale mà người dùng đã setting và set nó ở đây)
  static final locale = _getLocaleFromLanguage();

  static const fallbackLocale = Locale('en', 'US');

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale ?? fallbackLocale);
  }

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode;
    for (int i = 0; i < supportedlangCodes.length; i++) {
      if (lang == supportedlangCodes[i]) return locales[i];
    }
    return Get.locale;
  }

  // support langsCode
  static const supportedlangCodes = [
    'en',
    'vi',
  ];

  // support locales
  static const locales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

  static final enMap = en.map((key, value) => MapEntry(key.name, value));
  static final viMap = vi.map((key, value) => MapEntry(key.name, value));

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enMap,
        'vi_VN': viMap,
      };
}

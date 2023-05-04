import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:let_tutor_mobile/core/languages/my_localization.dart';

class TTSService {
  static final FlutterTts _flutterTts = FlutterTts();

  double speechRate = 0.6;

  static Future<void> speak(String text) async {
    await _flutterTts.speak(text);
  }

  static Future<void> stop() async {
    await _flutterTts.stop();
  }

  static Future<void> changeLocalization() async {
    debugPrint(MyLocalization.locale?.toLanguageTag());
    await _flutterTts.setLanguage(MyLocalization.locale?.toLanguageTag() ??
        MyLocalization.fallbackLocale.toLanguageTag());
  }
}

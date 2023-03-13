import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:let_tutor_mobile/app/data/models/database/global_setting_hive.dart';
import 'package:let_tutor_mobile/app/data/services/chat_gpt_service/tts_service.dart';
import 'package:let_tutor_mobile/core/languages/my_localization.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';

class AppStateController extends GetxController {
  late Box<GlobalSetting> database;
  late GlobalSetting appSettings;
  MyLocalization localizationGenerator = MyLocalization();

  Future<void> initialize() async {
    database = await Hive.openBox<GlobalSetting>("settings");

    appSettings = database.get("setting") ?? GlobalSetting();

    await _setLocalization(appSettings.localizationCode);
  }

  Future<void> changeTheme(bool isDark) async {
    await EasyLoading.show();

    appSettings.isDark = isDark;
    await database.put("setting", appSettings);

    Get.changeThemeMode(
      isDark ? ThemeMode.dark : ThemeMode.light,
    );
    await EasyLoading.dismiss();
  }

  Future<void> toggleLocalization(LocalizationCode localization) async {
    await EasyLoading.show();

    await _setLocalization(localization);

    await database.put("setting", appSettings);

    update();
    await EasyLoading.dismiss();
  }

  Future<void> toggleAutoRead(bool isAutoread) async {
    appSettings.isAutoRead = isAutoread;
    await database.put("setting", appSettings);
  }

  ThemeMode get themeMode {
    return appSettings.isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> _setLocalization(LocalizationCode localization) async {
    appSettings.localizationCode = localization;
    MyLocalization.changeLocale(localization.codename);
    await TTSService.changeLocalization(appSettings.localizationCode);
  }
}

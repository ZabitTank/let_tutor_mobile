import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:let_tutor_mobile/app/data/models/databases/global_setting_hive.dart';
import 'package:let_tutor_mobile/app/data/services/voice_gpt/tts_service.dart';
import 'package:let_tutor_mobile/core/languages/my_localization.dart';
import 'package:let_tutor_mobile/core/utils/secure_storage.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';

class GlobalSettingProvider extends ChangeNotifier {
  late Box<GlobalSetting> database;
  late GlobalSetting appSettings;

  get themeMode {
    return appSettings.isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> initialize() async {
    database = await Hive.openBox<GlobalSetting>("settings");
    appSettings = database.get("setting") ?? GlobalSetting();

    _setLocalization(appSettings.localization);
  }

  Future<void> toggleTheme(bool isDark) async {
    await EasyLoading.show();

    appSettings.isDark = isDark;
    await database.put("setting", appSettings);
    notifyListeners();

    EasyLoading.dismiss();
  }

  Future<void> toggleLocalization(LocalizationCode localization) async {
    await EasyLoading.show();

    await _setLocalization(localization);

    await database.put("setting", appSettings);

    notifyListeners();

    await EasyLoading.dismiss();
  }

  Future<void> _setLocalization(LocalizationCode localization) async {
    appSettings.localization = localization;
    // MyLocalization.language = appSettings.localization;
    // await TTSService.changeLocalization(appSettings.localization);
  }

  Future<void> toggleAutoRead(bool isAutoread) async {
    appSettings.isAutoRead = isAutoread;

    await database.put("setting", appSettings);
    notifyListeners();
  }

  Future<void> handleUseAPIKey(String? apiKey) async {
    if (apiKey != null && apiKey.isNotEmpty) {
      await SecureStorage.storeIdentity(apiKey);
    } else {
      await SecureStorage.deleteToken();
    }
  }
}

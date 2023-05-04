import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:let_tutor_mobile/app/data/models/databases/global_setting_hive.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/user_info.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/data/services/voice_gpt/tts_service.dart';
import 'package:let_tutor_mobile/core/languages/my_localization.dart';
import 'package:let_tutor_mobile/core/utils/secure_storage.dart';
import 'package:let_tutor_mobile/routes/app_routes.dart';

class AppStateController extends GetxController {
  final MyUserInfo _user = MyUserInfo();

  MyUserInfo get user => _user;

  set setUser(MyUserInfo user) {
    _user.updateValues(user);
  }

  late Box<GlobalSetting> database;
  late GlobalSetting appSettings;

  Future<void> initialize() async {
    database = await Hive.openBox<GlobalSetting>("settings");

    appSettings = database.get("setting") ?? GlobalSetting();
    await _setLocalization(appSettings.langCode);

    Get.changeThemeMode(
      appSettings.isDark ? ThemeMode.dark : ThemeMode.light,
    );
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

  Future<void> toggleLocalization(String langCode) async {
    await EasyLoading.show();
    await _setLocalization(langCode);
    await EasyLoading.dismiss();
  }

  Future<void> toggleAutoRead(bool isAutoread) async {
    appSettings.isAutoRead = isAutoread;
    await database.put("setting", appSettings);
  }

  ThemeMode get themeMode {
    return appSettings.isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> _setLocalization(String langCode) async {
    MyLocalization.changeLocale(langCode);

    appSettings.langCode = langCode;
    await database.put("setting", appSettings);

    TTSService.changeLocalization();
  }

  Future<void> handleUseAPIKey(String? apiKey) async {
    if (apiKey != null && apiKey.isNotEmpty) {
      await SecureStorage.storeIdentity(apiKey);
    } else {
      await SecureStorage.deleteIdToken();
    }
  }

  Future<void> logout() async {
    try {
      EasyLoading.show(status: 'Logout...');
      await LetTutorAPIService.authenAPIService.googleSignout();
      _resetState();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      EasyLoading.dismiss();
      Get.offAllNamed(Routes.login);
    }
  }

  Future<void> _resetState() async {
    // await database.delete("setting");
    await SecureStorage.deleteToken();
  }
}

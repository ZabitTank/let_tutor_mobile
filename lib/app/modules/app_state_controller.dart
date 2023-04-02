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
import 'package:let_tutor_mobile/core/values/enum.dart';
import 'package:let_tutor_mobile/routes/app_routes.dart';

class AppStateController extends GetxController {
  final MyUserInfo _user = MyUserInfo();
  // born because of special problem from user page -> edit profile
  final _rxUser = Rxn<MyUserInfo>();

  MyUserInfo get user => _user;

  get rxUser => _rxUser;

  set setUser(MyUserInfo user) {
    _user.updateValues(user);
  }

  late Box<GlobalSetting> database;
  late GlobalSetting appSettings;
  MyLocalization localizationGenerator = MyLocalization();

  Future<void> initialize() async {
    database = await Hive.openBox<GlobalSetting>("settings");

    appSettings = database.get("setting") ?? GlobalSetting();
    await _setLocalization(appSettings.localization);

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

  Future<void> toggleLocalization(LocalizationCode localization) async {
    await EasyLoading.show();

    await _setLocalization(localization);

    await database.put("setting", appSettings);
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
    appSettings.localization = localization;
    MyLocalization.changeLocale(localization.codename);
    TTSService.changeLocalization();
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

  @override
  void onClose() {
    _rxUser.close();
    super.onClose();
  }
}

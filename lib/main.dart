import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:let_tutor_mobile/app/data/models/databases/chat_history_hive.dart';
import 'package:let_tutor_mobile/app/data/models/databases/global_setting_hive.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/core/languages/my_localization.dart';
import 'package:let_tutor_mobile/core/theme/base_theme.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';
import 'package:let_tutor_mobile/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return GetBuilder<AppStateController>(builder: (controller) {
  //     debugPrint("Build APP");
  //     return GetMaterialApp(
  //       title: "LetTutor",
  //       initialRoute: AppPages.initial,
  //       getPages: AppPages.routes,
  //       theme: lightTheme,
  //       darkTheme: darkTheme,
  //       themeMode: controller.themeMode,
  //       builder: EasyLoading.init(),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "LetTutor",
      locale: MyLocalization.locale,
      fallbackLocale: MyLocalization.fallbackLocale,
      translations: MyLocalization(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: lightTheme,
      darkTheme: darkTheme,
      builder: EasyLoading.init(),
    );
  }
}

Future<void> _setup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocalizationCodeAdapter());
  Hive.registerAdapter(ChatModelAdapter());
  Hive.registerAdapter(GlobalSettingAdapter());
  Hive.registerAdapter(ChatHistoryAdapter());

  AppStateController appStateController =
      Get.put(AppStateController(), permanent: true);
  await appStateController.initialize();
}

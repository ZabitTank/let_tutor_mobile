import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:let_tutor_mobile/app/data/models/databases/chat_history_hive.dart';
import 'package:let_tutor_mobile/app/data/models/databases/global_setting_hive.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/core/languages/my_localization.dart';
import 'package:let_tutor_mobile/core/theme/base_theme.dart';
import 'package:let_tutor_mobile/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await _setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

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
  Hive.registerAdapter(ChatModelAdapter());
  Hive.registerAdapter(GlobalSettingAdapter());
  Hive.registerAdapter(ChatHistoryAdapter());

  await dotenv.load(fileName: ".env");

  AppStateController appStateController =
      Get.put(AppStateController(), permanent: true);
  await appStateController.initialize();
}

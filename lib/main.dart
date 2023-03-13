import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/core/theme/base_theme.dart';
import 'package:let_tutor_mobile/routes/app_pages.dart';

Future<void> _setup() async {}

void main() async {
  await _setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "LetTutor",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}

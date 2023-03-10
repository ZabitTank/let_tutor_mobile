import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/modules/login/login_view.dart';
import 'package:let_tutor_mobile/core/theme/base_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "LetTutor",
      home: const LoginView(),
      theme: baseTheme(),
    );
  }
}

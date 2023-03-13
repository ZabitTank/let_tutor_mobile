import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/modules/course_detail/course_detail_view.dart';
import 'package:let_tutor_mobile/core/theme/base_theme.dart';

Future<void> _setup() async {}

void main() async {
  await _setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LetTutor",
      // home: LoginView(formKey: GlobalKey<FormState>()),
      // home: const CoursesView(),
      home: const CourseDetail(),
      theme: lightTheme,
    );
  }
}

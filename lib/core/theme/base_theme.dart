import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: BaseColor.blue,
  highlightColor: BaseColor.red,
  scaffoldBackgroundColor: BaseColor.white,
  cardColor: const Color.fromARGB(255, 254, 254, 254),
  textTheme: TextTheme(
    headlineLarge:
        BaseTextStyle.heading1(color: const Color.fromARGB(255, 6, 65, 136)),
    headlineMedium:
        BaseTextStyle.heading2(color: const Color.fromARGB(255, 16, 112, 181)),
    headlineSmall:
        BaseTextStyle.heading3(color: const Color.fromARGB(255, 20, 202, 230)),
    bodyLarge: BaseTextStyle.body1(color: BaseColor.black),
    bodyMedium: BaseTextStyle.body2(color: BaseColor.black),
    bodySmall: BaseTextStyle.body3(color: BaseColor.black),
    labelLarge: BaseTextStyle.label1(color: BaseColor.white),
    labelMedium: BaseTextStyle.label2(color: BaseColor.black),
    labelSmall: BaseTextStyle.label3(color: BaseColor.black),
  ),
  appBarTheme: AppBarTheme(
      color: BaseColor.white,
      elevation: 3,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: BaseTextStyle.heading2(color: BaseColor.blue)),
  inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: BaseColor.lPrimaryColor),
        gapPadding: 10,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: BaseColor.red),
        gapPadding: 10,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.grey),
        gapPadding: 10,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: BaseColor.red),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: BaseColor.lPrimaryColor),
        gapPadding: 10,
      ),
      focusColor: BaseColor.lPrimaryColor),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.lightGreen,
  scaffoldBackgroundColor: const Color(0xff343541),
  cardColor: const Color(0xff444654),
  textTheme: TextTheme(
    bodySmall: BaseTextStyle.body3(color: Colors.white),
    bodyMedium: BaseTextStyle.body2(color: Colors.white),
    bodyLarge: BaseTextStyle.body1(color: Colors.white),
    headlineLarge: BaseTextStyle.heading1(color: Colors.white),
    headlineMedium: BaseTextStyle.heading2(color: Colors.white),
    headlineSmall: BaseTextStyle.heading3(color: Colors.white),
    labelSmall: BaseTextStyle.caption(
      color: const Color.fromARGB(255, 60, 234, 135),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(0, 53, 67, 55),
  ),
);

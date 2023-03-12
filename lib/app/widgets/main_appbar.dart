import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class LetTutorCommomWidget {
  static AppBar mainAppBar() {
    return AppBar(
      bottomOpacity: 20,
      leading: Container(
        alignment: Alignment.center,
        padding: const EdgeInsetsDirectional.only(start: 2),
        child: Image.asset(
          'assets/icons/lettutor_icon.png',
          fit: BoxFit.contain,
          width: 40,
        ),
      ),
      title: Text(
        "LetTutor",
        style: BaseTextStyle.appBar(
            color: BaseColor.blue, fontSize: 30, fontWeight: FontWeight.w900),
      ),
      titleSpacing: 2,
    );
  }
}

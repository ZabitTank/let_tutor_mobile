import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';

class LetTutorAppBar {
  static AppBar mainAppBarWithIcon(BuildContext context) {
    return AppBar(
      bottomOpacity: 40,
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
        style: context.appBarStyle,
      ),
      titleSpacing: 2,
    );
  }

  static AppBar mainAppBarWithTitleAndBackButton({
    required BuildContext context,
    required String title,
  }) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      leading: Builder(builder: (context) {
        return IconButton(
          alignment: AlignmentDirectional.center,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      }),
      actions: [
        Align(
          alignment: Alignment.topCenter,
          child: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                debugPrint("open drawer");
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
      ],
      title: Text(
        title,
        style: context.appBarStyle,
      ),
    );
  }
}

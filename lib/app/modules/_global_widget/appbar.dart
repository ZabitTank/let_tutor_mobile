import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/custom_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/languages/my_localization.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';

class LetTutorAppBar {
  static AppBar mainAppBarWithIconLogin(BuildContext context) {
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
        style: context.appBarStyle,
      ),
      titleSpacing: 2,
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.language),
          onSelected: (String result) async {
            await Get.find<AppStateController>().toggleLocalization(result);
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'vi',
              child: IconWithTitleTile(
                icon: Image.asset(
                  AssetsManager.vnIcon,
                  height: 20,
                  width: 20,
                ),
                title: Text("Tiếng việt", style: context.bodySmall),
              ),
            ),
            PopupMenuItem<String>(
              value: 'en',
              child: IconWithTitleTile(
                icon: Image.asset(
                  AssetsManager.enIcon,
                  height: 20,
                  width: 20,
                ),
                title: Text("Tiếng anh", style: context.bodySmall),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static AppBar mainAppBarHome(BuildContext context) {
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
        style: context.appBarStyle,
      ),
      titleSpacing: 2,
      actions: [
        Align(
          alignment: Alignment.topCenter,
          child: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
      ],
    );
  }

  static AppBar mainAppBarWithTitleAndBackButton({
    required BuildContext context,
    required String title,
  }) {
    return AppBar(
      titleSpacing: 2,
      centerTitle: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      leading: Builder(builder: (context) {
        return IconButton(
          alignment: AlignmentDirectional.center,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(closeOverlays: true);
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      }),
      actions: const [
        // Align(
        //   alignment: Alignment.topCenter,
        //   child: Builder(builder: (context) {
        //     return IconButton(
        //       icon: const Icon(Icons.list),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //     );
        //   }),
        // ),
      ],
      title: Text(
        title,
        style: context.appBarStyle,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/app/modules/home/home_controller.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';
import 'package:let_tutor_mobile/routes/app_routes.dart';

Widget createNavigationDrawer() {
  return const NavigationDrawer();
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Drawer Builded");
    final appState = Get.find<AppStateController>();
    Color hightlightColor = Theme.of(context).highlightColor;
    Color primaryColor = Theme.of(context).primaryColor;
    int currentIndex = Get.find<HomeController>().tabIndex.value;
    String currentPage = Get.currentRoute;

    return Drawer(
      child: ListView(
        children: [
          buildDrawerHeader(appState.user.name ?? "Unknown",
              appState.user.email ?? "Email@gmail.com", appState.user.avatar),
          const Divider(
            color: BaseColor.black,
          ),
          buildDrawerItem(
            text: "Tutors",
            icon: Icons.group,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: currentPage == Routes.home && currentIndex == 0
                ? hightlightColor
                : primaryColor,
            onTap: () {
              _handleNavigationToHome(0);
            },
          ),
          buildDrawerItem(
            text: "Courses",
            icon: Icons.school,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: currentPage == Routes.home && currentIndex == 1
                ? hightlightColor
                : primaryColor,
            onTap: () {
              _handleNavigationToHome(1);
            },
          ),
          buildDrawerItem(
            text: "Schedules",
            icon: Icons.calendar_month,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: currentPage == Routes.home && currentIndex == 2
                ? hightlightColor
                : primaryColor,
            onTap: () {
              _handleNavigationToHome(2);
            },
          ),
          buildDrawerItem(
            text: "Chat",
            icon: Icons.chat,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: currentPage == Routes.home && currentIndex == 3
                ? hightlightColor
                : primaryColor,
            onTap: () {
              _handleNavigationToHome(3);
            },
          ),
          buildDrawerItem(
            text: "Profile",
            icon: CupertinoIcons.profile_circled,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: Get.currentRoute == Routes.profile
                ? hightlightColor
                : primaryColor,
            onTap: () {
              Get.back(closeOverlays: true);
              Get.toNamed(Routes.profile);
            },
          ),
          buildDrawerItem(
            text: "Settings",
            icon: Icons.settings,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: Get.currentRoute == Routes.settings
                ? hightlightColor
                : primaryColor,
            onTap: () {
              Get.back(closeOverlays: true);
              Get.toNamed(Routes.settings);
            },
          ),
          buildDrawerItem(
            text: "Logout",
            icon: Icons.logout,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: context.appBarStyle?.color,
            onTap: () async {
              await appState.logout();
            },
          ),
        ],
      ),
    );
  }

  Widget buildDrawerHeader(
      String accountName, String accountEmail, String? url) {
    return UserAccountsDrawerHeader(
      accountName: Text(accountName),
      accountEmail: Text(accountEmail),
      currentAccountPicture:
          url == "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png" ||
                  url == null
              ? const CircleAvatar(
                  backgroundImage: AssetImage(AssetsManager.userImage),
                )
              : Image.network(url),
      currentAccountPictureSize: const Size.square(72),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: textIconColor,
      ),
      title: Text(
        text,
        style: TextStyle(color: tileColor),
      ),
      onTap: onTap,
    );
  }

  void _handleNavigationToHome(int index) {
    Get.back(closeOverlays: true);
    if (Get.currentRoute != Routes.home) {
      Get.until(
        (route) => Get.currentRoute == Routes.home,
      );
    }
    Get.find<HomeController>().changeTabIndex(index);
  }
}

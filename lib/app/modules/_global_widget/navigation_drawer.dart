import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    Color hightlightColor = Theme.of(context).highlightColor;
    Color primaryColor = Theme.of(context).primaryColor;

    return Drawer(
      child: ListView(
        children: [
          buildDrawerHeader("Account Name", "Email@gmail.com"),
          const Divider(
            color: BaseColor.black,
          ),
          buildDrawerItem(
            text: "Tutor",
            icon: Icons.menu_book,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: Get.currentRoute == Routes.teachers
                ? hightlightColor
                : primaryColor,
            onTap: () {
              Get.offNamed(Routes.teachers);
            },
          ),
          buildDrawerItem(
            text: "Schedule",
            icon: Icons.calendar_month,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: Get.currentRoute == Routes.schedules
                ? hightlightColor
                : primaryColor,
            onTap: () {
              Get.offNamed(Routes.schedules);
            },
          ),
          buildDrawerItem(
            text: "History",
            icon: Icons.schedule,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: Get.currentRoute == Routes.coursesHistory
                ? hightlightColor
                : primaryColor,
            onTap: () {
              Get.offNamed(Routes.coursesHistory);
            },
          ),
          buildDrawerItem(
            text: "Courses",
            icon: Icons.school,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: Get.currentRoute == Routes.courses
                ? hightlightColor
                : primaryColor,
            onTap: () {
              Get.offNamed(Routes.courses);
            },
          ),
          buildDrawerItem(
            text: "My Courses",
            icon: Icons.menu_book_sharp,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: Get.currentRoute == Routes.courses
                ? hightlightColor
                : primaryColor,
            onTap: () {
              Get.offNamed(Routes.courses);
            },
          ),
          buildDrawerItem(
            text: "Become Tutor",
            icon: Icons.abc,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: Get.currentRoute == Routes.teachers
                ? hightlightColor
                : primaryColor,
            onTap: () {},
          ),
          buildDrawerItem(
            text: "Logout",
            icon: Icons.logout,
            textIconColor: Theme.of(context).primaryColor,
            tileColor: context.appBarStyle?.color,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget buildDrawerHeader(String accountName, String accountEmail) {
  return UserAccountsDrawerHeader(
    accountName: Text(accountName),
    accountEmail: Text(accountEmail),
    currentAccountPicture: const CircleAvatar(
      backgroundImage: AssetImage(AssetsManager.userImage),
    ),
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

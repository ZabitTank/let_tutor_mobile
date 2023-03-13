import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/appbar.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/navigation_drawer.dart';
import 'package:let_tutor_mobile/app/modules/chat/chat_view.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/courses_view.dart';
import 'package:let_tutor_mobile/app/modules/home/home_controller.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_view.dart';
import 'package:let_tutor_mobile/app/modules/tutors/tutors_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LetTutorAppBar.mainAppBarHome(context),
      drawer: createNavigationDrawer(),
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            TutorsView(),
            CoursesView(),
            SchedulesView(),
            ChatView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.group,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Tutors',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Schedules',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Chat',
            ),
          ],
          elevation: 3,
          showUnselectedLabels: true,
          selectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          selectedItemColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

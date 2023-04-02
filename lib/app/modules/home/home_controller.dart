import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/app/modules/chat/chat_controller.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/courses_controller.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_controller.dart';
import 'package:let_tutor_mobile/app/modules/tutors/tutors_controller.dart';

class HomeController extends GetxController {
  final appState = Get.find<AppStateController>();
  var tabIndex = 0.obs;
  late final TutorsController tutorsController;
  late final CoursesController coursesController;
  late final SchedulesController schedulesController;
  late final ChatController chatController;

  @override
  void onInit() async {
    super.onInit();
    tutorsController = Get.find<TutorsController>();
    coursesController = Get.find<CoursesController>();
    schedulesController = Get.find<SchedulesController>();
    chatController = Get.find<ChatController>();

    try {
      final userInfo = await LetTutorAPIService.userAPIService.getMe();
      appState.setUser = userInfo;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}

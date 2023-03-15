import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/chat/chat_controller.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/courses_controller.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_controller.dart';
import 'package:let_tutor_mobile/app/modules/tutors/tutors_controller.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  late final TutorsController tutorsController;
  late final CoursesController coursesController;
  late final SchedulesController schedulesController;
  late final ChatController chatController;

  @override
  void onInit() {
    super.onInit();
    tutorsController = Get.find<TutorsController>();
    coursesController = Get.find<CoursesController>();
    schedulesController = Get.find<SchedulesController>();
    chatController = Get.find<ChatController>();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}

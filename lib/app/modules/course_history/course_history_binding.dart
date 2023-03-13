import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/course_history/course_history_controller.dart';

class CourseHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseHistoryController>(
      () => CourseHistoryController(),
    );
  }
}

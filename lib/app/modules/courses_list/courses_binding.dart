import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/courses_controller.dart';

class CoursesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesController>(
      () => CoursesController(),
    );
  }
}

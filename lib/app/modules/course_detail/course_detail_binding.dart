import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/course_detail/course_detail_controller.dart';

class CourseDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseDetailController>(
      () => CourseDetailController(),
    );
  }
}

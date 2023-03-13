import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/teacher_detail/teacher_controller.dart';

class TeacherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherController>(
      () => TeacherController(),
    );
  }
}

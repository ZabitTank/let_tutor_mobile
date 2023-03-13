import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/teachers_list/teachers_controller.dart';

class TeachersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeachersController>(
      () => TeachersController(),
    );
  }
}

import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/tutors/tutors_controller.dart';

class TutorsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TutorsController>(
      () => TutorsController(),
    );
  }
}

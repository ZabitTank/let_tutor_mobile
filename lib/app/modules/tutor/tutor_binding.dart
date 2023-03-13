import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/tutor/tutor_controller.dart';

class TutorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TutorController>(
      () => TutorController(),
    );
  }
}

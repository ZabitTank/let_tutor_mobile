import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/pdf/pdf_controller.dart';

class CoursePdfBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursePdfController>(
      () => CoursePdfController(),
    );
  }
}

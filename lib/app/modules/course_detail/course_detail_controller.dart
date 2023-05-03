import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/course.dart';

class CourseDetailController extends GetxController {
  final isLoading = true.obs;
  Course? course;
  @override
  void onClose() {
    isLoading.close();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    course = Get.arguments;
    isLoading.value = false;
  }
}

import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/teacher.dart';

class TutorController extends GetxController {
  late TeacherInfo teacherInfo;

  @override
  void onInit() {
    super.onInit();
    teacherInfo = TeacherInfo.teacherInfo;
  }
}

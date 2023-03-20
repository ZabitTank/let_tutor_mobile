import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/model/small.dart';

class TutorController extends GetxController {
  late TutorInfo teacherInfo;

  @override
  void onInit() {
    super.onInit();
    teacherInfo = TutorInfo.test;
  }
}

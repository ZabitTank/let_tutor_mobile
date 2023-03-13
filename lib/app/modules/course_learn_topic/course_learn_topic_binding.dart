import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/course_learn_topic/course_learn_topic_controller.dart';

class CourseLearnTopicBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseLearnTopicController>(
      () => CourseLearnTopicController(),
    );
  }
}

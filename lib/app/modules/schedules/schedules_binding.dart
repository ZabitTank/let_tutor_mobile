import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_controller.dart';

class SchedulesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchedulesController>(
      () => SchedulesController(),
    );
  }
}

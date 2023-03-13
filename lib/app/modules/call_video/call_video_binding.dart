import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/call_video/call_video_controller.dart';

class CallVideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallVideoController>(
      () => CallVideoController(),
    );
  }
}

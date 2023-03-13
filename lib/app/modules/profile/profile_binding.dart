import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/chat/chat_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}

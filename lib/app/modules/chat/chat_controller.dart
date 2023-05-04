import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/voice_gpt_module/providers/gpt_chat_provider.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';

class ChatController extends GetxController {
  final appState = Get.find<AppStateController>();
  final isLoading = true.obs;
  late ChatProvider chatProvider;

  @override
  void onClose() {
    isLoading.close();
    super.onClose();
  }

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    chatProvider = ChatProvider();
    await chatProvider.initialize();
    isLoading.value = false;
  }
}

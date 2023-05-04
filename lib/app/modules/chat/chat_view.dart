import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/voice_gpt_module/chat_page/chat_screen.dart';
import 'package:let_tutor_mobile/app/voice_gpt_module/providers/gpt_model_provider.dart';
import 'package:let_tutor_mobile/app/modules/chat/chat_controller.dart';
import 'package:provider/provider.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => ModelsProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => controller.chatProvider,
                ),
              ],
              child: ChatScreen(
                appState: controller.appState,
              ),
            )),
    );
  }
}

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:let_tutor_mobile/app/data/services/voice_gpt/tts_service.dart';
import 'package:let_tutor_mobile/app/voice_gpt_module/chat_page/widgets/chat_ultils.dart';
import 'package:let_tutor_mobile/app/voice_gpt_module/providers/gpt_chat_provider.dart';
import 'package:let_tutor_mobile/app/voice_gpt_module/providers/gpt_model_provider.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';
import 'package:let_tutor_mobile/app/voice_gpt_module/chat_page/widgets/chat_widget.dart';
import 'package:let_tutor_mobile/core/extensions/string.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.appState});
  final AppStateController appState;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  SpeechToText speechToText = SpeechToText();
  late bool _isTyping;
  late bool _isListening;
  late TextEditingController textEditingController;
  late bool isWaitingResponse;
  late FocusNode focusNode;
  late ScrollController scrollController;

  @override
  void initState() {
    _isListening = false;
    _isTyping = false;
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    scrollController = ScrollController();
    isWaitingResponse = false;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Assistant", style: BaseTextStyle.heading2()),
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(AssetsManager.openAILogo),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await ChatScreenUltils.showModalSheet(context, modelsProvider);
            },
            icon: const Icon(
              Icons.model_training,
              color: Colors.amber,
            ),
          ),
          IconButton(
            onPressed: () async {
              bool? confirm = await showYesNoDialog(
                (LocalizationKeys.settingscreen_section_gpt_delete.tr),
                (LocalizationKeys.settingscreen_section_gpt_delete_confirm.tr),
              );

              if (confirm != null && confirm == true) {
                await chatProvider.clearChatlog();
              } else {}
            },
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              controller: scrollController,
              itemCount: chatProvider.getChatList.length,
              itemBuilder: (context, index) => ChatWidget(
                chatIndex: chatProvider.getChatList[index].chatIndex,
                msg: chatProvider.getChatList[index].msg,
              ),
            ),
          ),
          if (_isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
          ],
          addVerticalSpace(15),
          Material(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    controller: textEditingController,
                    enabled: !isWaitingResponse,
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                        hintText: LocalizationKeys.chatscreen_hint_textfield.tr,
                        hintStyle: context.labelSmall,
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await handleSendMessage(
                        chatProvider: chatProvider,
                        modelsProvider: modelsProvider);
                  },
                  icon: const Icon(Icons.send,
                      color: Color.fromARGB(255, 63, 150, 4)),
                ),
                AvatarGlow(
                    endRadius: 30.0,
                    animate: _isListening,
                    showTwoGlows: true,
                    glowColor: const Color.fromARGB(255, 0, 255, 8),
                    duration: const Duration(milliseconds: 2000),
                    repeat: true,
                    repeatPauseDuration: const Duration(microseconds: 100),
                    child: GestureDetector(
                      onTapDown: (details) async {
                        if (isWaitingResponse) return;

                        var avaiable = await speechToText.initialize();
                        if (avaiable) {
                          setState(() {
                            _isListening = true;
                            speechToText.listen(
                              onResult: (result) {
                                setState(() {
                                  textEditingController.text =
                                      result.recognizedWords;
                                });
                              },
                            );
                          });
                        }
                      },
                      onTapUp: (details) async {
                        await speechToText.stop();

                        setState(() {
                          _isListening = false;
                        });
                      },
                      child: CircleAvatar(
                        radius: 20,
                        child: Icon(_isListening ? Icons.mic : Icons.mic_none),
                      ),
                    )),
              ],
            ),
          )
        ],
      )),
    );
  }

  Future<void> handleSendMessage(
      {required ModelsProvider modelsProvider,
      required ChatProvider chatProvider}) async {
    try {
      if (textEditingController.text.isEmpty) {
        ChatScreenUltils.showError(
            context, LocalizationKeys.chatscreen_error_empty_textfield.tr);
        return;
      }
      await chatProvider.addUserMessage(
        msg: textEditingController.text,
      );

      setState(() {
        _resetTextFieldStateBefore();
      });

      String generatedText = await chatProvider.sendMessageAndGetAnswers(
          msg: textEditingController.text,
          chosenModelId: modelsProvider.currentModel);

      if (widget.appState.appSettings.isAutoRead) {
        TTSService.speak(generatedText);
      }
    } catch (e) {
      ChatScreenUltils.showError(context, e.toString());
    } finally {
      setState(() {
        _resetTextFieldStateAfter();
      });
    }
  }

  void scrollToTheEnd() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2), curve: Curves.easeOut);
  }

  void _resetTextFieldStateBefore() {
    _isTyping = true;
    isWaitingResponse = true;
    textEditingController.clear();
    focusNode.unfocus();
    scrollToTheEnd();
  }

  void _resetTextFieldStateAfter() {
    scrollToTheEnd();
    _isTyping = false;
    isWaitingResponse = false;
  }
}

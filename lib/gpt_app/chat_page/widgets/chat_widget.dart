import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/data/services/voice_gpt/tts_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/chat_page/widgets/message_widget.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.msg,
    required this.chatIndex,
  });

  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userImage
                      : AssetsManager.chatImage,
                  width: 30,
                  height: 30,
                ),
                addHorizontalSpace(8),
                Expanded(
                  child: MessageContentWidget(
                      label: msg, textStyle: context.bodyMedium!),
                ),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () async {
                              TTSService.speak(msg);
                            },
                            icon: const Icon(
                              Icons.voice_chat,
                              size: 16,
                            ),
                          )
                        ],
                      )
              ],
            ),
          ),
        )
      ],
    );
  }
}

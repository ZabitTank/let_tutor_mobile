import 'package:hive/hive.dart';
import 'package:let_tutor_mobile/app/data/models/rest/voice_gpt/chat_completion_response.dart';

part 'chat_history_hive.g.dart';

@HiveType(typeId: 2)
class ChatHistory {
  @HiveField(0, defaultValue: [])
  List<ChatModel> chatHistory;

  ChatHistory({
    this.chatHistory = const [],
  });
}

@HiveType(typeId: 3)
class ChatModel {
  @HiveField(0)
  final String msg;
  @HiveField(1)
  final int chatIndex;

  static List<ChatCompletionMessage> modelsFromSnapshot(
      List<ChatModel> modelSnapshot) {
    return modelSnapshot
        .map((data) => ChatCompletionMessage(
            role: data.chatIndex == 0 ? "user" : "assistant",
            content: data.msg))
        .toList();
  }

  ChatModel({required this.msg, required this.chatIndex});
}

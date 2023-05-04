import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:let_tutor_mobile/app/data/models/databases/chat_history_hive.dart';
import 'package:let_tutor_mobile/app/data/models/rest/voice_gpt/chat_completion_request.dart';
import 'package:let_tutor_mobile/app/data/models/rest/voice_gpt/chat_completion_response.dart';
import 'package:let_tutor_mobile/core/languages/my_localization.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';

import '../../data/services/voice_gpt/gpt_api_service.dart';

class ChatProvider with ChangeNotifier {
  List<ChatCompletionMessage> _chatcompletionLog = [];

  late ChatHistory history;
  late Box<ChatHistory> database;

  List<ChatModel> get getChatList {
    return history.chatHistory;
  }

  Future<void> addUserMessage({required String msg}) async {
    final editMessage = _shamelessTrickModifyMessage(
        msg, MyLocalization.locale?.languageCode ?? "en");
    _chatcompletionLog.add(
      ChatCompletionMessage(role: "user", content: editMessage),
    );

    history.chatHistory.add(ChatModel(msg: msg, chatIndex: 0));
    await database.put("chat", history);

    notifyListeners();
  }

  Future<String> sendMessageAndGetAnswers({
    required String msg,
    required String chosenModelId,
  }) async {
    try {
      var chatCompletion = await GptApiService.sendRequest(ChatComletionRequest(
          messages: _chatcompletionLog, model: chosenModelId));

      history.chatHistory.add(ChatModel(
          msg: chatCompletion.choices[0].message.content, chatIndex: 1));
      _chatcompletionLog.add(chatCompletion.choices[0].message);

      await database.put("chat", history);
      notifyListeners();

      return chatCompletion.choices[0].message.content;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> clearChatlog() async {
    await EasyLoading.show();
    history.chatHistory = [];
    await database.put("chat", history);
    notifyListeners();
    await EasyLoading.dismiss();
  }

  Future<void> initialize() async {
    database = await Hive.openBox<ChatHistory>("history");
    history = database.get("chat") ?? ChatHistory(chatHistory: []);
    _chatcompletionLog = ChatModel.modelsFromSnapshot(history.chatHistory);
  }

  String _shamelessTrickModifyMessage(String message, String langCode) {
    String addonString =
        AssetsManager.mapMyLocalizeToMessageAddon[langCode] ?? "";
    return "$message$addonString}";
  }
}

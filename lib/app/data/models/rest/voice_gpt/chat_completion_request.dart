// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/voice_gpt/chat_completion_response.dart';
part 'chat_completion_request.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatComletionRequest {
  String model;
  List<ChatCompletionMessage> messages;
  int? max_tokens;
  bool? stream;

  ChatComletionRequest(
      {required this.model,
      required this.messages,
      this.max_tokens = 100,
      this.stream = false});

  factory ChatComletionRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatComletionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatComletionRequestToJson(this);
}

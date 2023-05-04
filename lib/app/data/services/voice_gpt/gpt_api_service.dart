import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:let_tutor_mobile/app/data/models/rest/voice_gpt/chat_completion_request.dart';
import 'package:let_tutor_mobile/app/data/models/rest/voice_gpt/chat_completion_response.dart';
import 'package:let_tutor_mobile/app/data/models/rest/voice_gpt/gpt_model_info.dart';
import 'package:let_tutor_mobile/app/data/providers/api_provider.dart';
import 'package:let_tutor_mobile/core/values/backend_enviroment.dart';

class GptAPIPaths {
  static const String getModel = "/models";
  static const String getMessage = "/chat/completions";
}

class GptApiService {
  static Future<List<GPTModelInfo>> getModels() async {
    try {
      var response = await RestAPIProvider.instance.get(
          endpoint: BackendEnviroment.openaiUrl + GptAPIPaths.getModel,
          useIdToken: true,
          useToken: true);

      if (response.data['error'] != null) {
        print(response.data['error']["message"]);
        return Future.error(response.data['error']['message']);
      }

      List modelSnapshot = [];
      for (var model in response.data['data']) {
        modelSnapshot.add(model);
      }

      return GPTModelInfo.modelsFromSnapshot(modelSnapshot);
    } catch (e) {
      print(e.toString());
      return Future.error("App Error");
    }
  }

  static Future<ChatCompletionResponse> sendRequest(
      ChatComletionRequest requestBody) async {
    try {
      var response = await RestAPIProvider.instance.post(
          body: requestBody,
          endpoint: BackendEnviroment.openaiUrl + GptAPIPaths.getMessage,
          useIdToken: true,
          useToken: true);

      if (response.data['error'] != null) {
        return Future.error(response.data['error']['message']);
      }

      return ChatCompletionResponse.fromJson(response.data);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Stream<String> receiveGenerateTextStream(
      ChatComletionRequest requestBody, StreamController controller) async* {
    final url = Uri.parse('https://api.openai.com/v1/completions');
    final headers = {'Authorization': 'Bearer YOUR_API_KEY'};

    // Create a StreamedRequest and write the request body as a stream
    final request = http.Request('POST', url);
    request.headers.addAll(headers);

    final body = jsonEncode({
      'prompt': "prompt",
      'temperature': '0.5',
      'max_tokens': '10',
    });

    request.body = body;

    // Send the request and handle the response as a stream
    final response = await request.send();

    // final stream = response.stream.transform(utf8.decoder);
    // final buffer = StringBuffer();
    // await for (final chunk in stream) {
    //   buffer.write(chunk);
    //   final data = jsonDecode(buffer.toString());
    //   final text = data['choices'][0]['text'] as String;
    //   yield text;
    //   buffer.clear();
    // }

    await for (final data in response.stream.transform(utf8.decoder)) {
      final decodedData = jsonDecode(data);
      final text = decodedData['choices'][0]['text'];
      controller.add(text);
    }
  }
}

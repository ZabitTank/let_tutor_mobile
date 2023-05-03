import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:let_tutor_mobile/app/data/models/rest/voice_gpt/gpt_model_info.dart';
import 'package:let_tutor_mobile/app/data/services/voice_gpt/gpt_api_service.dart';

class ModelsProvider with ChangeNotifier {
  String currentModel = "gpt-3.5-turbo-0301";
  List<GPTModelInfo> modelsList = [];

  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  List<GPTModelInfo> get getModelsList {
    return modelsList;
  }

  Future<List<GPTModelInfo>> getAllModels() async {
    await EasyLoading.show();
    modelsList = await GptApiService.getModels();
    await EasyLoading.dismiss();

    return modelsList;
  }
}

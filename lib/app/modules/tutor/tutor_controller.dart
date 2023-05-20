import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/tutor_info_detail.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';

class TutorController extends GetxController {
  final isLoading = false.obs;

  TutorInfoDetail? fetchedTutor;
  late TutorInfoDetail tutor;
  String? flag;
  String? countryName;

  @override
  onClose() {
    isLoading.close();
    super.onClose();
  }

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    try {
      tutor = Get.arguments!;
      fetchedTutor =
          await LetTutorAPIService.tutorAPIService.getTutorById(tutor.userId!);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

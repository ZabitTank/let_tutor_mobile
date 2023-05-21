import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/tutor_info_detail.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class TutorController extends GetxController {
  final isLoading = false.obs;
  final isFavorite = true.obs;
  TutorInfoDetail? fetchedTutor;
  late TutorInfoDetail tutor;
  String? flag;
  String? countryName;

  @override
  onClose() {
    isLoading.close();
    isFavorite.close();
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
      await fetchCountryAndFlag();
      isFavorite.value = fetchedTutor?.isFavorite ?? false;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addFavorite() async {
    try {
      await LetTutorAPIService.userAPIService.addFavoriteTutor(tutor.userId!);
      if (tutor.isfavoritetutor == null) {
        tutor.isfavoritetutor = "1";
        isFavorite.value = true;
      } else {
        tutor.isfavoritetutor = null;
        isFavorite.value = false;
      }
    } catch (_) {
      showSnackBar("Failed", "Failed to add favorite");
    } finally {}
  }

  Future<void> fetchCountryAndFlag() async {
    final response = await http.get(
      Uri.parse(
        'https://restcountries.com/v2/alpha/${tutor.country ?? "vn"}',
      ),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      flag = json['flag'];
      countryName = json["name"];
    }
  }
}

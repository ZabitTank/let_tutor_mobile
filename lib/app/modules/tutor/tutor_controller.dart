import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/small.dart';
import 'package:http/http.dart' as http;

class TutorController extends GetxController {
  final isLoading = false.obs;

  late TutorInfo tutor;
  String? flag;
  String? countryName;

  Future<void> _fetchCountryAndFlag() async {
    final response = await http.get(
      Uri.parse(
        'https://restcountries.com/v2/alpha/${tutor.User!.country}',
      ),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      flag = json['flag'];
      countryName = json["name"];
    }
  }

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    try {
      tutor = TutorInfo.test;
      await _fetchCountryAndFlag();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

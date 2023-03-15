import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';

class TutorsController extends GetxController {
  final appStateController = Get.find<AppStateController>();
  final TextEditingController findTutorController = TextEditingController();

  var filtersNation = <String>[].obs;
  final specifierFilter = Rx<String?>(null);
  final dateFilter = Rx<DateTime?>(null);
  final selectedStartTime = Rx<TimeOfDay?>(null);
  final selectedEndTime = Rx<TimeOfDay?>(null);

  @override
  void onInit() {
    // fetch data here
    super.onInit();
  }

  @override
  void onClose() {
    selectedStartTime.close();
    selectedEndTime.close();
    specifierFilter.close();
    filtersNation.close();
    findTutorController.dispose();

    super.onClose();
  }

  Future<void> filter() async {}

  void resetFilter() {
    findTutorController.clear();
    dateFilter.value = null;
    selectedStartTime.value = null;
    filtersNation.clear();
    filtersNation.refresh();

    specifierFilter.value = null;
    selectedEndTime.value = null;
  }
}

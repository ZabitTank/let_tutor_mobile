import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/tutors_search_response.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';

class TutorsController extends GetxController {
  final appStateController = Get.find<AppStateController>();
  final TextEditingController findTutorController = TextEditingController();

  var filtersNation = <String>[].obs;
  final specifierFilter = Rx<String?>(null);
  final dateFilter = Rx<DateTime?>(null);
  final selectedStartTime = Rx<TimeOfDay?>(null);
  final selectedEndTime = Rx<TimeOfDay?>(null);

  final size = 4;
  int page = 1;
  int totalPage = 1;

  TutorsSearchResponse? result;

  int? hours;
  int? minutes;

  final isLoading = true.obs;
  final paginationLoading = true.obs;
  @override
  void onInit() async {
    super.onInit();
    try {
      isLoading.value = true;

      await filter();
      int totalMinutes =
          await LetTutorAPIService.valueAPIService.getTotalMinutesLearning();

      hours = (totalMinutes / 60).ceil();
      minutes = totalMinutes % 60;
    } catch (e) {
      showSnackBar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addFavorite(String tutorId) async {
    try {
      await LetTutorAPIService.userAPIService.addFavoriteTutor(tutorId);
    } catch (_) {
      showSnackBar("Failed", "Failed to add favorite");
    }
  }

  @override
  void onClose() {
    isLoading.close();
    paginationLoading.close();
    selectedStartTime.close();
    selectedEndTime.close();
    specifierFilter.close();
    filtersNation.close();
    findTutorController.dispose();

    super.onClose();
  }

  Future<void> filter({
    bool newFilter = true,
  }) async {
    paginationLoading.value = true;
    if (newFilter) {
      page = 1;
    }
    try {
      result = await LetTutorAPIService.tutorAPIService.search(
          page: page,
          perPage: size,
          date: dateFilter.value,
          search: findTutorController.text,
          specialties: specifierFilter.value,
          tutoringTimeAvailableFrom: selectedStartTime.value,
          tutoringTimeAvailableTo: selectedEndTime.value);

      totalPage = (result!.count / size).ceil();
    } catch (e) {
      showSnackBar("Error", e.toString());
    } finally {
      paginationLoading.value = false;
    }
  }

  Future<void> onPageChanged(int newPage) async {
    if (newPage > totalPage || newPage < 0) {
      return;
    } else {
      page = newPage;
      await filter(newFilter: false);
    }
  }

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

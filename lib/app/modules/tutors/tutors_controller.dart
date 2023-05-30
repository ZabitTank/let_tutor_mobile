import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/booking.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/bookings_response.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/tutors_search_response.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/core/utils/helper.dart';

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

  TutorsSearchResponse? tutors;
  Booking? nextSchedule;

  final hours = 0.obs;
  final minutes = 1.obs;

  final isLoading = true.obs;
  final bannerLoading = true.obs;
  final paginationLoading = true.obs;

  @override
  void onClose() {
    timer?.cancel();
    hours.close();
    minutes.close();
    isLoading.close();
    paginationLoading.close();
    selectedStartTime.close();
    selectedEndTime.close();
    specifierFilter.close();
    filtersNation.close();
    findTutorController.dispose();
    bannerLoading.close();
    super.onClose();
  }

  @override
  void onInit() {
    try {
      isLoading.value = true;

      filter();
      getTotalLearning();
      getInComingLesson();
    } catch (e) {
      showSnackBar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
    super.onInit();
  }

  Future<void> getTotalLearning() async {
    int totalMinutes =
        await LetTutorAPIService.valueAPIService.getTotalMinutesLearning();

    hours.value = (totalMinutes / 60).ceil();
    minutes.value = totalMinutes % 60;
  }

  Future<void> addFavorite(String tutorId) async {
    try {
      await LetTutorAPIService.userAPIService.addFavoriteTutor(tutorId);
    } catch (_) {
      showSnackBar("Failed", "Failed to add favorite");
    }
  }

  Future<void> filter({
    bool newFilter = true,
  }) async {
    paginationLoading.value = true;
    if (newFilter) {
      page = 1;
    }
    try {
      tutors = await LetTutorAPIService.tutorAPIService.search(
          page: page,
          perPage: size,
          date: dateFilter.value,
          search: findTutorController.text,
          specialties: specifierFilter.value,
          tutoringTimeAvailableFrom: selectedStartTime.value,
          tutoringTimeAvailableTo: selectedEndTime.value);

      totalPage = (tutors!.count / size).ceil();
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

  Timer? timer;
  final countdown = "".obs;
  Future<void> getInComingLesson() async {
    try {
      bannerLoading.value = true;
      nextSchedule = await LetTutorAPIService.scheDuleAPIService.next();
      if (nextSchedule == null) return;
      DateTime start = Helper.timeStampToDateTime(
          nextSchedule!.scheduleDetailInfo!.startPeriodTimestamp!);

      final totalSecond = start.difference(DateTime.now()).inSeconds;

      startTimer(totalSecond);
    } catch (_) {
    } finally {
      bannerLoading.value = false;
    }
  }

  String convertSecondsToHMS(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = (seconds % 3600) % 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  startTimer(int seconds) {
    timer?.cancel();
    const duration = Duration(seconds: 1);
    var remainSecond = seconds;

    timer = Timer.periodic(duration, (timer) {
      if (remainSecond == 0) {
        timer.cancel();
      } else {
        remainSecond--;
        countdown.value = convertSecondsToHMS(remainSecond);
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/bookings_response.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/app/modules/schedules/widgets/dropdown_button_dialog.dart';

class SchedulesController extends GetxController {
  final appStateController = Get.find<AppStateController>();
  TextEditingController textFieldController = TextEditingController();
  String dropdownValue = 'Option 1'; // Default value
  RxBool isRefreshing = false.obs;

  final perPage = 4;
  int page = 1;
  int totalPage = 1;

  BookingsResponse? result;

  final isLoading = true.obs;
  final paginationLoading = true.obs;
  @override
  void onInit() async {
    try {
      isLoading.value = true;
      more();
    } catch (e) {
      showSnackBar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
    super.onInit();
  }

  @override
  void onClose() {
    isLoading.close();
    paginationLoading.close();
    super.onClose();
  }

  Future<void> more() async {
    paginationLoading.value = true;

    try {
      result = await LetTutorAPIService.scheDuleAPIService.bookingHistory(
        page: page,
        perPage: perPage,
        isOld: false,
      );
      totalPage = (result!.count / perPage).ceil();
    } catch (e) {
      showSnackBar("Error", e.toString());
    } finally {
      paginationLoading.value = false;
    }
  }

  Future<void> onPageChanged(int pageNumber) async {
    if (pageNumber > totalPage || pageNumber < 0) {
      return;
    } else {
      page = pageNumber;
      await more();
    }
  }

  Future<void> cancelBooking(String bookId) async {
    final options = await LetTutorAPIService.valueAPIService.getCancelReason();
    bool isrefresh =
        await Get.dialog(CancelBookingDialog(options: options, bookId: bookId));

    if (isrefresh) {
      await more();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/bookings_response.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

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
    super.onInit();
    try {
      isLoading.value = true;
      await more();
    } catch (e) {
      showSnackBar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
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
    int? selectedOptions;
    String note = "";
    final options = await LetTutorAPIService.valueAPIService.getCancelReason();

    await Get.dialog(
      AlertDialog(
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(
                "What was the reason you cancel this booking?",
                style: BaseTextStyle.heading3(),
              ),
              DropdownButton(
                value: selectedOptions,
                items: options
                    .map((e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(
                            e.reason!,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  selectedOptions = value!;
                },
              ),
              sh_20,
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  note = value;
                },
                maxLines: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("No")),
                  TextButton(
                      style: const ButtonStyle(),
                      onPressed: () async {
                        try {
                          if (selectedOptions == null) {
                            showSnackBar("You must choose reason", "");
                          } else {
                            await LetTutorAPIService.scheDuleAPIService
                                .deleteBooking(
                                    bookId, selectedOptions.toString(), note);
                            await more();
                            Get.back();
                          }
                        } catch (_) {}
                      },
                      child: const Text("Yes"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/bookings_response.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';

class SchedulesController extends GetxController {
  final appStateController = Get.find<AppStateController>();

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

  Future<void> editRequest() async {}
}

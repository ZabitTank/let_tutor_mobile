import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/courses_response.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/small.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/app_state_controller.dart';

class CoursesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final appState = Get.find<AppStateController>();
  final List<Tab> courseTab = const <Tab>[
    Tab(text: 'Course'),
    Tab(text: 'E-Book'),
    Tab(text: 'Interactive')
  ];

  final size = 4;
  int page = 1;
  int totalPage = 1;

  late TabController tabController;
  final tabIndex = 0.obs;
  final isLoading = true.obs;
  final paginationLoading = true.obs;

  late final TextEditingController searchController;
  RxString sort = "ASC".obs;

  var selectLevelOptionList = <int>[];
  var selectCategoryOptionList = <String>[];
  late List<ContentCategory> categoryList;
  GetCoursesResponse? result;

  @override
  void onClose() {
    sort.close();
    tabIndex.close();
    paginationLoading.close();
    tabController.dispose();
    searchController.dispose();
    super.onClose();
  }

  Future<void> filter({
    bool newFilter = true,
  }) async {
    paginationLoading.value = true;
    try {
      if (newFilter) {
        page = 1;
      }

      result = await LetTutorAPIService.courAPIService.getCourses(
        size: size,
        page: page,
        categoryId: selectCategoryOptionList,
        level: selectLevelOptionList,
        orderBy: sort.value,
        search: searchController.text,
      );
      totalPage = (result!.count / size).ceil();
    } catch (e) {
      showSnackBar("Error", e.toString());
    } finally {
      paginationLoading.value = false;
    }
  }

  Future<void> onPageChanged(int pageNumber) async {
    paginationLoading.value = true;
    if (pageNumber >= totalPage || pageNumber < 0) {
      return;
    } else {
      page = pageNumber;
      await filter(newFilter: false);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    searchController = TextEditingController();
    tabController = TabController(length: courseTab.length, vsync: this);
    try {
      isLoading.value = true;
      categoryList =
          await LetTutorAPIService.valueAPIService.getContentCategory();
      await filter();
    } catch (e) {
      showSnackBar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

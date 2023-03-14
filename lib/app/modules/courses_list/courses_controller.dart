import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> courseTab = const <Tab>[
    Tab(text: 'Course'),
    Tab(text: 'E-Book'),
    Tab(text: 'Interactive')
  ];

  late TabController tabController;
  final tabIndex = 0.obs;
  late final TextEditingController searchController;
  final sort = 'ascending'.obs;

  var selectLevelOptionList = <String?>[];
  var selectCategoryOptionList = <String>[];

  Future<void> filter() async {
    debugPrint(
        "Course-view-filter: ${sort.value} - ${selectLevelOptionList.toString()} - ${selectCategoryOptionList.toString()}");
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    tabController = TabController(length: courseTab.length, vsync: this);

    super.onInit();
  }

  @override
  void onClose() {
    sort.close();
    tabController.dispose();
    searchController.dispose();
    super.onClose();
  }
}

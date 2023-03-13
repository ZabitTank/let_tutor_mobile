import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  var selectLevelOptionList = <String?>[];
  var selectCategoryOptionList = <String>[];
  String? sort = 'ascending';

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

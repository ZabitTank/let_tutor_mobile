import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/filter_widget.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/test_widget.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/courses_controller.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/widgets/course_info_card.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CoursesView extends GetView<CoursesController> {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Course View build");

    var multiFilterLevel = MultiSelectDialogField(
      selectedItemsTextStyle: context.labelMedium,
      items: levels.map((e) => MultiSelectItem(e, e!)).toList(),
      onConfirm: (values) async {
        controller.selectLevelOptionList = values;
        await controller.filter();
      },
    );

    var multiFilterCategory = MultiSelectDialogField(
      selectedItemsTextStyle: context.labelMedium,
      items: categories.map((e) => MultiSelectItem(e, e!)).toList(),
      onConfirm: (values) async {
        controller.selectLevelOptionList = values;
        await controller.filter();
      },
    );

    var dropDownButtonSelectSort = DropdownSortFilter(
        selectedItem: controller.sort,
        items: sorts,
        onSelect: () async {
          await controller.filter();
        });

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              sh_20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TestWidget.emptyCircleContainer(size: 80),
                  sw_20,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore Courses',
                          style: context.headlineMedium,
                        ),
                        sh_10,
                        SearchField(
                            controller: controller.searchController,
                            onFilter: () async {
                              await controller.filter();
                            })
                      ],
                    ),
                  ),
                ],
              ),
              sh_20,
              sh_20,
              Text(
                lorem,
                style: context.bodyMedium,
              ),
              sh_20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Filter Level", style: context.labelMedium),
                  multiFilterLevel,
                  sh_20,
                  Text("Filter Categories", style: context.labelMedium),
                  multiFilterCategory,
                  sh_20,
                  Text("Sort", style: context.labelMedium),
                  dropDownButtonSelectSort,
                ],
              ),
              sh_10,
              SizedBox(
                height: 50,
                child: AppBar(
                  bottom: TabBar(
                    controller: controller.tabController,
                    labelColor: BaseColor.black,
                    tabs: controller.courseTab,
                    onTap: (value) {
                      controller.tabIndex.value = value;
                    },
                  ),
                ),
              ),
              sh_20,
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.courseTab[controller.tabIndex.value].text!,
                        style: context.headlineMedium,
                      ),
                    ),
                    sh_20,
                    Column(
                      children: const [
                        CourseCard(),
                        sh_10,
                        CourseCard(),
                        sh_10,
                        CourseCard(),
                        sh_10,
                        CourseCard(),
                      ],
                    ),
                    sh_10,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const levels = <String?>['Any Level', 'Beginner', 'Intermediate', 'Advanced'];
const categories = <String?>[
  'English for Bussiness',
  'English For Fun',
  'Bad English',
  'ChetahPanick'
];
const sorts = ['ascending', 'descending'];

const lorem =
    'Lorem ipsum dolor sit amet, dunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/custom_pagination.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/filter_widget.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/test_widget.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/courses_controller.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/widgets/course_info_card.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CoursesView extends GetView<CoursesController> {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Course View build");
    return SafeArea(
      child: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      sh_20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.network(
                            "https://sandbox.app.lettutor.com/static/media/course.0bf1bb71.svg",
                            width: 80,
                            height: 80,
                          ),
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
                          MultiSelectDialogField(
                            selectedItemsTextStyle: context.labelMedium,
                            items: levelsFilter.entries
                                .map((entry) =>
                                    MultiSelectItem(entry.key, entry.value))
                                .toList(),
                            onConfirm: (values) async {
                              controller.selectLevelOptionList = values;
                              await controller.filter();
                            },
                          ),
                          sh_20,
                          Text("Filter Categories", style: context.labelMedium),
                          MultiSelectDialogField(
                            selectedItemsTextStyle: context.labelMedium,
                            items: controller.categoryList
                                .map((e) => MultiSelectItem(e.id!, e.title!))
                                .toList(),
                            onConfirm: (values) async {
                              controller.selectCategoryOptionList = values;
                              await controller.filter();
                            },
                          ),
                          sh_20,
                          Text("Sort", style: context.labelMedium),
                          DropdownSortFilter(
                              onSelect: () async {
                                await controller.filter();
                              },
                              selectedItem: controller.sort,
                              items: sadSort),
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
                        () => controller.paginationLoading.value
                            ? const CircularProgressIndicator()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller
                                          .courseTab[controller.tabIndex.value]
                                          .text!,
                                      style: context.headlineMedium,
                                    ),
                                  ),
                                  sh_20,
                                  Column(
                                    children: List.generate(
                                        controller.result?.rows.length ?? 0,
                                        (index) => Column(children: [
                                              CourseCard(
                                                  course: controller
                                                      .result!.rows[index]),
                                              sh_10
                                            ])),
                                  ),
                                  sh_10,
                                  PaginationSection(
                                    // Pass necessary parameters to the PaginationSection
                                    currentPage: controller.page,
                                    totalPages: controller.totalPage,
                                    onPageChanged: (page) async {
                                      await controller.onPageChanged(page);
                                    },
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

const lorem =
    'LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.';

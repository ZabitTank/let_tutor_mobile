import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/custom_pagination.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/tutors/tutors_controller.dart';
import 'package:let_tutor_mobile/core/extensions/string.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';

import 'widgets/tutor_card.dart';

class TutorsView extends GetView<TutorsController> {
  const TutorsView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    var filterSection = Row(
      children: [
        Text(
          LocalizationKeys.tutorscreen_recommended_tutor_textfield.tr,
          style: themeData.textTheme.headlineMedium,
        ),
        IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(Icons.filter_alt_sharp))
      ],
    );

    return SafeArea(
      child: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  await controller.filter(newFilter: false);
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeBanner(
                            themeData: themeData, controller: controller),
                        sh_20,
                        filterSection,
                        Obx(
                          () => controller.paginationLoading.value
                              ? const Center(child: CircularProgressIndicator())
                              : controller.result?.rows.isEmpty ?? true
                                  ? const Center(
                                      child: SizedBox(
                                        width: 200,
                                        height: 500,
                                        child: Center(
                                          child: Text("Nothing to Show"),
                                        ),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Column(
                                          children: List.generate(
                                            controller.result?.rows.length ?? 0,
                                            (index) => TutorCard(
                                                addFavorite: (tutorId) async {
                                                  await controller
                                                      .addFavorite(tutorId);
                                                },
                                                tutor: controller
                                                    .result!.rows[index]),
                                          ),
                                        ),
                                        PaginationSection(
                                          // Pass necessary parameters to the PaginationSection
                                          currentPage: controller.page,
                                          totalPages: controller.totalPage,
                                          onPageChanged: (page) async {
                                            await controller
                                                .onPageChanged(page);
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
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    required this.themeData,
    required this.controller,
  });

  final ThemeData themeData;
  final TutorsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: themeData.primaryColor,
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              "Incoming Course",
              style: BaseTextStyle.heading2(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Wed, 17 May 23 12:30 - 12:55",
                  style: BaseTextStyle.body2(),
                ),
                IconButton(
                  icon: const Icon(Icons.start),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "${LocalizationKeys.tutorscreen_total_hours_leared_textfield.tr} ",
                  style: BaseTextStyle.body1(),
                ),
                Text(
                  controller.hours?.toString() ?? "x",
                  style: BaseTextStyle.body1(),
                ),
                Text(
                  " ${LocalizationKeys.hour.tr} ",
                  style: BaseTextStyle.body1(),
                ),
                Text(
                  controller.minutes?.toString() ?? "x",
                  style: BaseTextStyle.body1(),
                ),
                Text(
                  " ${LocalizationKeys.minutes.tr}",
                  style: BaseTextStyle.body1(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

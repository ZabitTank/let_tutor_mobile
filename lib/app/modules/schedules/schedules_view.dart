import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/custom_pagination.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/login/widgets/clickable_textspan.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_controller.dart';
import 'package:let_tutor_mobile/app/modules/schedules/widgets/schedule_card.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/routes/app_routes.dart';

class SchedulesView extends GetView<SchedulesController> {
  const SchedulesView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    var tutorsViewIntro = Container(
      decoration: BoxDecoration(
        color: themeData.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Schedule",
            style: themeData.textTheme.headlineMedium,
          ),
          Text(
            maxLines: 4,
            "You can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours",
            style: BaseTextStyle.body3(),
          ),
          ClickableTextSpan(
            callback: () async {
              Get.toNamed(Routes.coursesHistory);
            },
            style: themeData.textTheme.bodyMedium,
            text: "Or you can ",
            highlightText: "view old schedule",
          ),
        ],
      ),
    );

    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      tutorsViewIntro,
                      Obx(
                        () => controller.paginationLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : controller.result?.rows.isEmpty ?? true
                                ? Center(
                                    child: SizedBox(
                                      width: 200,
                                      height: 500,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("Nothing to Show"),
                                          IconButton(
                                              onPressed: () async {
                                                await controller.more();
                                              },
                                              icon: const Icon(
                                                  Icons.replay_outlined))
                                        ],
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: [
                                      Column(
                                        children: List.generate(
                                          controller.result?.rows.length ?? 0,
                                          (index) => SecheduleCard(
                                            booking:
                                                controller.result!.rows[index],
                                            editRequest: () async {
                                              await controller.editRequest();
                                            },
                                          ),
                                        ),
                                      ),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/appbar.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/custom_pagination.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/course_history/course_history_controller.dart';
import 'package:let_tutor_mobile/app/modules/course_history/widgets/old_schedule.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class CourseHistoryView extends GetView<CourseHistoryController> {
  const CourseHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    var tutorsViewIntro = Container(
      decoration: BoxDecoration(
        color: themeData.cardColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.network(
            "https://sandbox.app.lettutor.com/static/media/history.1e097d10.svg",
            width: 60,
            height: 60,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Schedule",
                  style: themeData.textTheme.headlineMedium,
                ),
                Text(
                  maxLines: 4,
                  "You can track when the old schedule, and review, report your tutor,",
                  style: BaseTextStyle.body3(),
                ),
              ],
            ),
          )
        ],
      ),
    );

    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: LetTutorAppBar.mainAppBarWithTitleAndBackButton(
                  title: "History", context: context),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sh_20,
                        tutorsViewIntro,
                        sh_20,
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
                                            (index) => OldMeetingCard(
                                                booking: controller
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

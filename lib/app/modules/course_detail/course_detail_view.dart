import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/navigation_drawer.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/course_detail/course_detail_controller.dart';
import 'package:let_tutor_mobile/app/modules/course_detail/widgets/course_explore_card.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/appbar.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/languages/_en.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/routes/app_routes.dart';

class CourseDetail extends GetView<CourseDetailController> {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LetTutorAppBar.mainAppBarWithTitleAndBackButton(
        context: context,
        title: "Course Detail",
      ),
      drawer: createNavigationDrawer(),
      floatingActionButton: FloatingActionButton(
        hoverColor: BaseColor.green,
        onPressed: () {},
        child: const Icon(Icons.chat_bubble_outline_rounded),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        CourseCardExplore(course: controller.course),
                        addVerticalSpace(20),
                        const CourseDescriptionHeader(description: "Overview"),
                        CourseAttribute(
                          title: "Why take this course",
                          description: controller.course?.purpose ?? lorem,
                          icon: questionMaskIcon,
                        ),
                        addVerticalSpace(20),
                        const CourseDescriptionHeader(
                            description: "Experience Level"),
                        CourseAttribute(
                          title: controller.course?.level ?? "Beginner",
                          description: controller.course?.other_details ?? "",
                          icon: peopleIcon,
                        ),
                        addVerticalSpace(20),
                        const CourseDescriptionHeader(
                            description: "Course Length"),
                        CourseAttribute(
                          title: controller.course?.topics != null
                              ? "${controller.course?.topics?.length} Topic"
                              : "6 Topic",
                          description: controller.course?.reason ?? "",
                          icon: docIcon,
                        ),
                        addVerticalSpace(20),
                        const CourseDescriptionHeader(
                            description: "List Topics"),
                        addVerticalSpace(10),
                        ...controller.course!.topics!
                            .asMap()
                            .entries
                            .map((entry) => GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.courseLearnTopic,
                                        arguments: entry.value);
                                  },
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      height: 100,
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${entry.key}.",
                                            style: context.bodyMedium,
                                          ),
                                          Text(
                                            "${entry.value.name}.",
                                            style: context.bodyMedium,
                                          ),
                                          Text(
                                            "${entry.value.description}.",
                                            style: context.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class CourseAttribute extends StatelessWidget {
  const CourseAttribute({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            icon,
            const SizedBox(
              width: 3,
            ),
            Text(title, style: context.labelMedium),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Text(
            description,
            style: context.bodySmall,
          ),
        )
      ],
    );
  }
}

class CourseDescriptionHeader extends StatelessWidget {
  const CourseDescriptionHeader({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(18),
      child: Text(
        description,
        style: context.headlineMedium,
      ),
    );
  }
}

const questionMaskIcon = Material(
  color: Colors.transparent,
  shape: CircleBorder(side: BorderSide(color: Colors.red)),
  child: Icon(
    size: 20,
    Icons.question_mark_rounded,
    color: Colors.red,
  ),
);

const peopleIcon = Material(
  color: Colors.transparent,
  child: Icon(
    size: 20,
    Icons.people_alt_rounded,
    color: Colors.blue,
  ),
);

const docIcon = Material(
  color: Colors.transparent,
  child: Icon(
    size: 20,
    Icons.document_scanner_rounded,
    color: Colors.blue,
  ),
);

const List<String> topics = [
  'I want to sleep',
  'I want to sleep 2',
  'I want to sleep 3'
];

const lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco';

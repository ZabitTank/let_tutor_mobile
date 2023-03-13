import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/course_detail/course_detail_controller.dart';
import 'package:let_tutor_mobile/app/modules/course_detail/widgets/course_explore_card.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/common_widget.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class CourseDetail extends GetView<CourseDetailController> {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LetTutorAppBar.mainAppBarWithTitleAndBackButton(
        context: context,
        title: "Course Detail",
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: BaseColor.green,
        onPressed: () {},
        child: const Icon(Icons.chat_bubble_outline_rounded),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const CourseCardExplore(),
              addVerticalSpace(20),
              const CourseDescriptionHeader(description: "Overview"),
              const CourseAttribute(
                title: "Why take this course",
                description: lorem,
                icon: questionMaskIcon,
              ),
              addVerticalSpace(20),
              const CourseDescriptionHeader(description: "Experience Level"),
              const CourseAttribute(
                title: "Beginner",
                description: "This course for noob",
                icon: peopleIcon,
              ),
              addVerticalSpace(20),
              const CourseDescriptionHeader(description: "Course Length"),
              const CourseAttribute(
                title: "6 Topic",
                description: "Sleep now",
                icon: docIcon,
              ),
              addVerticalSpace(20),
              const CourseDescriptionHeader(description: "List Topics"),
              addVerticalSpace(10),
              ...topics
                  .asMap()
                  .entries
                  .map((entry) => Card(
                        elevation: 2,
                        child: Container(
                          height: 100,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${entry.key}.",
                                  style: BaseTextStyle.body2()),
                              Text("${entry.value}.",
                                  style: BaseTextStyle.body2()),
                            ],
                          ),
                        ),
                      ))
                  .toList()
            ],
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
            Text(
              title,
              style: BaseTextStyle.subtitle2(),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Text(description),
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
        style: BaseTextStyle.heading2(),
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

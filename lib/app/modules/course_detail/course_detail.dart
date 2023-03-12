import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/modules/course_detail/widgets/course_explore_card.dart';
import 'package:let_tutor_mobile/app/widgets/main_appbar.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    const sw_20 = SizedBox(
      width: 20,
    );
    const sh_10 = SizedBox(
      height: 10,
    );
    const sh_20 = SizedBox(
      height: 20,
    );
    return Scaffold(
      appBar: LetTutorCommomWidget.mainAppBar(),
      floatingActionButton: FloatingActionButton(
        hoverColor: BaseColor.green,
        onPressed: () {},
        child: const Icon(Icons.chat_bubble_outline_rounded),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: const [
              CourseCardExplore(),
              sh_20,
              CourseDescriptionHeader(description: "Overview"),
              sh_20,
              CourseDescriptionHeader(description: "Experience Level"),
              sh_20,
              CourseDescriptionHeader(description: "Course Length"),
              sh_20,
              CourseDescriptionHeader(description: "List Topics"),
            ],
          ),
        ),
      ),
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

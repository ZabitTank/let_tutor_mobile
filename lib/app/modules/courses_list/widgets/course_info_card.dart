import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/course.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/test_widget.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/routes/app_routes.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.courseDetail, arguments: course);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            course.imageUrl != null
                ? Image.network(
                    course.imageUrl!,
                    width: double.infinity,
                    height: 100,
                  )
                : TestWidget.emptyRetangleContainer(
                    width: double.infinity, height: 180),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name ?? "title",
                    style: context.headlineSmall,
                  ),
                  sh_10,
                  Text(
                    course.description ??
                        "For teenager who have an excellent sleep chetah lorem pnacik",
                    style: context.bodySmall,
                  ),
                  sh_20,
                  Text(
                    course.level == null ? "Level" : "Level ${course.level}",
                    style: context.bodyMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/course.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/test_widget.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class CourseCardExplore extends StatelessWidget {
  const CourseCardExplore({super.key, required this.course});
  final Course? course;
  @override
  Widget build(BuildContext context) {
    const SizedBox sh_10 = SizedBox(
      height: 10,
    );
    const SizedBox sh_20 = SizedBox(
      height: 20,
    );
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TestWidget.emptyRetangleContainer(
                width: double.infinity, height: 320),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course?.name ?? "What a title",
                    style: context.headlineSmall,
                  ),
                  sh_10,
                  Text(
                    course?.description ??
                        "For teenager who have an excellent sleep chetah lorem pnacik",
                    style: context.bodySmall,
                  ),
                  sh_20,
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(double.infinity, 20),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Discover",
                        style: BaseTextStyle.heading3(color: BaseColor.white),
                      ),
                    ),
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

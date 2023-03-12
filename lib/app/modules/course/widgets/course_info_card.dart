import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/widgets/test_widget.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.sh_10,
    required this.sh_20,
  });

  final SizedBox sh_10;
  final SizedBox sh_20;

  @override
  Widget build(BuildContext context) {
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
                width: double.infinity, height: 180),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What a title",
                    style: BaseTextStyle.heading3(),
                  ),
                  sh_10,
                  Text(
                    "For teenager who have an excellent sleep chetah lorem pnacik",
                    style: BaseTextStyle.body3(),
                  ),
                  sh_20,
                  Text(
                    'Level',
                    style: BaseTextStyle.body2(),
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

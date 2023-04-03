import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    var tutorsViewIntro = Container(
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
            Text(
              LocalizationKeys.tutorscreen_total_hours_leared_textfield.tr,
              style: BaseTextStyle.body1(),
            ),
          ],
        ),
      ),
    );

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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              tutorsViewIntro,
              sh_20,
              filterSection,
              2 != 0
                  ? Column(
                      children: List.generate(
                        5,
                        (index) => GestureDetector(
                          onTap: () {},
                          child: TutorCard(),
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 200,
                      height: 500,
                      child: Center(
                          child: Icon(
                        Icons.replay_outlined,
                        size: 50,
                      )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

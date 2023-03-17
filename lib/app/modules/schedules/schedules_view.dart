import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_controller.dart';
import 'package:let_tutor_mobile/app/modules/schedules/widgets/schedule_card.dart';
import 'package:let_tutor_mobile/core/extensions/string.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';

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
            style: BaseTextStyle.heading2(),
          ),
          Text(
            maxLines: 4,
            "You can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours",
            style: BaseTextStyle.body3(),
          ),
        ],
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
                          child: SecheduleCard(),
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 200,
                      height: 500,
                      child: Center(
                          child: Icon(
                        Icons.find_replace_outlined,
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

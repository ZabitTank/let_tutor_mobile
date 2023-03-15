import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/filter_widget.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/home/home_controller.dart';
import 'package:let_tutor_mobile/core/extensions/string.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/languages/my_localization.dart';
import 'package:let_tutor_mobile/core/utils/helper.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class FilterDrawer extends GetView<HomeController> {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("End Drawer build");

    return Obx(
      () => controller.tabIndex.value == 0
          ? SizedBox(
              width: 300.0,
              height: Helper.getSize(context, 100, isHeight: true),
              child: Drawer(
                elevation: 4.0,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text("Filters Tutors",
                            style: context.headlineMedium),
                      ),
                      sh_20,
                      sh_20,
                      SearchField(
                        showIcon: false,
                        controller:
                            controller.tutorsController.findTutorController,
                        hint: LocalizationKeys
                            .tutorscreen_find_tutors_filter_name_hint.tr,
                        onFilter: () async {
                          await controller.tutorsController.filter();
                        },
                      ),
                      sh_20,
                      MultiSelectDialogField(
                        buttonText: Text(LocalizationKeys
                            .tutorscreen_find_tutors_filter_nation_hint.tr),
                        title: Text(LocalizationKeys
                            .tutorscreen_find_tutors_filter_nation_hint.tr),
                        items: tutorsNationFilter[
                                MyLocalization.locale?.languageCode]!
                            .map((e) => MultiSelectItem(e, e))
                            .toList(),
                        listType: MultiSelectListType.CHIP,
                        initialValue: controller.tutorsController.filtersNation,
                        onConfirm: (values) {
                          for (final value in values) {
                            controller.tutorsController.filtersNation
                                .add(value);
                          }
                        },
                      ),
                      sh_20,
                      ListTile(
                        title: Text(
                            LocalizationKeys
                                .tutorscreen_find_datime_section_textfield.tr,
                            style: context.labelMedium),
                      ),
                      DateFilterDrawerSection(
                          dateFilter: controller.tutorsController.dateFilter),
                      TimeFilterDrawerSection(
                          title: "Start time",
                          selectedTime:
                              controller.tutorsController.selectedStartTime),
                      TimeFilterDrawerSection(
                          title: "End time",
                          selectedTime:
                              controller.tutorsController.selectedEndTime),
                      ActionChoiceChip(
                        options: specifiers,
                        selectedOption:
                            controller.tutorsController.specifierFilter,
                        title: "Select specifier",
                      ),
                      sh_10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Accept'),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              controller.tutorsController.resetFilter();
                            },
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}

class DateFilterDrawerSection extends StatelessWidget {
  const DateFilterDrawerSection({
    super.key,
    required this.dateFilter,
  });

  final Rx<DateTime?> dateFilter;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.date_range),
          dateFilter.value == null
              ? const Text("Choose Date")
              : Text(
                  "From: ${Helper.dateTimeToDate(dateFilter.value)}",
                  style: context.bodyMedium,
                ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () async {
              await DateFilterUtils.chooseDate(dateFilter, "Select From",
                  predicate: DateFilterUtils.disablePastDate);
            },
          ),
        ],
      ),
    );
  }
}

class TimeFilterDrawerSection extends StatelessWidget {
  const TimeFilterDrawerSection(
      {super.key, required this.selectedTime, required this.title});
  final Rx<TimeOfDay?> selectedTime;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.alarm_rounded),
          selectedTime.value != null
              ? Text(
                  '$title: ${selectedTime.value!.format(context)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              : Text(
                  'Select $title',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () async {
              await DateFilterUtils.chooseTime(
                  context, selectedTime, "Select start time");
            },
          ),
        ],
      ),
    );
  }
}

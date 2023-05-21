import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/call_video/call_video_view.dart';
import 'package:let_tutor_mobile/app/modules/tutors/tutors_controller.dart';
import 'package:let_tutor_mobile/core/extensions/string.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/utils/helper.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    required this.themeData,
    required this.controller,
  });

  final ThemeData themeData;
  final TutorsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: themeData.primaryColor,
      ),
      child: Obx(
        () => controller.isLoading.value
            ? Container()
            : Center(
                child: Column(
                  children: [
                    Text(
                      "Incoming Course",
                      style: BaseTextStyle.heading2(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        controller.booking == null
                            ? const Text("You don't have any upcoming lesson")
                            : Text(
                                "${Helper.formatDateTime(Helper.timeStampToDateTime(controller.booking?.scheduleDetailInfo?.startPeriodTimestamp))} ${Helper.addHoursToTime(controller.booking?.scheduleDetailInfo?.startPeriod)} - ${Helper.addHoursToTime(controller.booking?.scheduleDetailInfo?.scheduleInfo?.endTime)}",
                                style: BaseTextStyle.body2(),
                              ),
                        sw_10,
                        Obx(
                          () => Text(
                            controller.countdown.value,
                            style: BaseTextStyle.body2(
                                color: themeData.highlightColor),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            "${LocalizationKeys.tutorscreen_total_hours_leared_textfield.tr} ",
                            style: BaseTextStyle.body1(),
                          ),
                          Text(
                            controller.hours.value.toString(),
                            style: BaseTextStyle.body1(),
                          ),
                          Text(
                            " ${LocalizationKeys.hour.tr} ",
                            style: BaseTextStyle.body1(),
                          ),
                          Text(
                            controller.minutes.value.toString(),
                            style: BaseTextStyle.body1(),
                          ),
                          Text(
                            " ${LocalizationKeys.minutes.tr}",
                            style: BaseTextStyle.body1(),
                          ),
                        ],
                      ),
                    ),
                    sh_10,
                    controller.booking != null
                        ? TextButton(
                            onPressed: () {
                              CallVideo.joinMeeting(
                                  user: controller.appStateController.user,
                                  booking: controller.booking!);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.yellowAccent),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.access_time),
                                Text('Enter Room'),
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
      ),
    );
  }
}

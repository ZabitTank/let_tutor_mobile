import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/booking.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_controller.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/utils/helper.dart';

import '../../call_video/call_video_view.dart';

class SecheduleCard extends StatelessWidget {
  const SecheduleCard(
      {super.key,
      required this.booking,
      required this.cancelBooking,
      required this.controller});

  final Booking booking;
  final SchedulesController controller;
  final void Function(String id) cancelBooking;

  @override
  Widget build(BuildContext context) {
    final scheduleDetail = booking.scheduleDetailInfo?.scheduleInfo;

    final canGoMeeting = Helper.timeStampToDateTime(
                booking.scheduleDetailInfo!.startPeriodTimestamp!)
            .difference(DateTime.now())
            .inHours <
        2;

    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Helper.dateTimeToDate(Helper.timeStampToDateTime(
                            booking.scheduleDetailInfo!.startPeriodTimestamp!)),
                        style: BaseTextStyle.heading3(fontSize: 19),
                      ),
                      Text(
                        "1 lesson",
                        style: BaseTextStyle.body3(),
                      ),
                    ],
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          canGoMeeting ? themeData.primaryColor : Colors.grey),
                    ),
                    onPressed: () async {
                      if (!canGoMeeting) return;
                      await joinMeeting(
                          user: controller.appStateController.user,
                          booking: booking);
                    },
                    child: Text(
                      "Go to Meeting",
                      style: BaseTextStyle.button(
                          color: themeData.scaffoldBackgroundColor),
                    ),
                  )
                ],
              ),
              sh_10,
              Card(
                color: BaseColor.lCardColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(booking.scheduleDetailInfo
                              ?.scheduleInfo?.tutorInfo?.avatar ??
                          "https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00"),
                      radius: 30,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    booking.scheduleDetailInfo?.scheduleInfo
                                            ?.tutorInfo?.name ??
                                        "Teacher name",
                                    style: BaseTextStyle.heading3(fontSize: 18),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.message,
                                        color: themeData.primaryColor,
                                      ),
                                      Text(
                                        "Direct message",
                                        style: BaseTextStyle.label3(
                                            fontSize: 14,
                                            color: themeData.primaryColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              sh_20,
              Column(
                children: List.generate(
                  1,
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Section $index: ${Helper.addHoursToTime(scheduleDetail?.startTime ?? "")} -  ${Helper.addHoursToTime(scheduleDetail?.endTime ?? "")}"),
                      TextButton(
                        onPressed: () {
                          if (canGoMeeting) {
                            showSnackBar("Failed",
                                "You can't cancel booking before two hours");
                          }
                          cancelBooking.call(booking.id!);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                (canGoMeeting
                                    ? Colors.grey
                                    : themeData.highlightColor))),
                        child: Text(
                          "Cancel",
                          style: BaseTextStyle.button(
                              color: themeData.scaffoldBackgroundColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: BaseColor.lCardColor,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Request for lesson",
                              style: themeData.textTheme.bodyLarge,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Edit Request",
                                style: themeData.textTheme.labelSmall,
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          height: 3,
                        ),
                        Text(
                          booking.studentRequest ??
                              "bla bla ball bla bla bla bla bla bla b bla bla bla bla bla bla bla bla balbla bla bal bla bla bla bla bla bla bla bla bla balbla bla bal bla bla bla bla bla bla bla bla bla balbla bla bal bla bla bla bla bla bla bla bla bla bal",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

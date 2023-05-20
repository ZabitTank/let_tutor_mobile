import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/booking.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class OldMeetingCard extends StatelessWidget {
  const OldMeetingCard({super.key, required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    final tutor = booking.scheduleDetailInfo?.scheduleInfo?.tutorInfo;
    final sheduleInfo = booking.scheduleDetailInfo?.scheduleInfo;
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {},
        child: Card(
          color: BaseColor.lCardColor,
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sh_10,
                Card(
                  color: themeData.scaffoldBackgroundColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(tutor?.avatar ??
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
                                      tutor?.name ?? "Teacher name",
                                      style:
                                          BaseTextStyle.heading3(fontSize: 18),
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
                Card(
                  color: themeData.scaffoldBackgroundColor,
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "Lesson Time: ${sheduleInfo?.startTime ?? "Start"} - ${sheduleInfo?.endTime ?? "End"}",
                      style: TextStyle(
                          color: themeData.textTheme.bodyLarge?.color,
                          fontSize: 20),
                    ),
                  ),
                ),
                Card(
                  color: themeData.scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.studentRequest ?? "No request for lesson",
                        style: themeData.textTheme.bodyLarge,
                      ),
                      const Divider(
                        height: 10,
                      ),
                      Text(
                        booking.tutorReview ?? "Tutor haven't reviewed yet",
                        style: themeData.textTheme.bodyLarge,
                      ),
                      const Divider(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Add a Rating",
                              style: TextStyle(
                                fontSize:
                                    themeData.textTheme.bodyMedium?.fontSize,
                                color: themeData.primaryColor,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Report",
                              style: TextStyle(
                                fontSize:
                                    themeData.textTheme.bodyMedium?.fontSize,
                                color: themeData.primaryColor,
                              ),
                            ),
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
      ),
    );
  }
}

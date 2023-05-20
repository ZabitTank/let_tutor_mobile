import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/booking.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';

class SecheduleCard extends StatelessWidget {
  const SecheduleCard(
      {super.key, required this.booking, required this.editRequest});

  final Booking booking;
  final void Function() editRequest;

  @override
  Widget build(BuildContext context) {
    final scheduleDetail = booking.scheduleDetailInfo?.scheduleInfo;
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {},
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
                          booking.scheduleDetailInfo?.scheduleInfo?.date ??
                              "Wed, 17 May 12",
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
                        backgroundColor:
                            MaterialStateProperty.all(themeData.primaryColor),
                      ),
                      onPressed: () {},
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
                Column(
                  children: List.generate(
                    1,
                    (index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Section $index: ${scheduleDetail?.startTime ?? ""} -  ${scheduleDetail?.endTime ?? ""}"),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  (themeData.highlightColor))),
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
                                onTap: () {
                                  editRequest.call();
                                },
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
      ),
    );
  }
}

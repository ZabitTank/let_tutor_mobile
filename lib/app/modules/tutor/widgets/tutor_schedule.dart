// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/schedule.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';

import '../../../../core/utils/helper.dart';

class TutorScheduleBottomModal extends StatefulWidget {
  const TutorScheduleBottomModal({Key? key, required this.tutorId})
      : super(key: key);

  final String tutorId;

  @override
  State<TutorScheduleBottomModal> createState() =>
      _TutorScheduleBottomModalState();
}

class _TutorScheduleBottomModalState extends State<TutorScheduleBottomModal> {
  List<Schedule> _schedules = [];
  bool isLoading = true;

  void fetchSchedules() async {
    List<Schedule> res = await LetTutorAPIService.scheDuleAPIService
        .getTutorSchedule(widget.tutorId);

    if (mounted) {
      setState(() {
        _schedules = res;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (mounted && isLoading) {
      fetchSchedules();
    }
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: () {
              showAvaiableScheduleDate();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1000))),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 13, bottom: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Booked", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future showAvaiableScheduleDate() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.6,
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Text("Select date",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, bottom: 10),
                      child: GridView.count(
                        crossAxisCount:
                            Helper.generateAsisChildRatio(constraints)[0]
                                .toInt(),
                        childAspectRatio:
                            (1 / Helper.generateAsisChildRatio(constraints)[1]),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        children: List.generate(
                          _schedules.length,
                          (index) => ElevatedButton(
                            onPressed: () async {
                              await showTutorTimePicker(_schedules[index]);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                side: BorderSide(color: Colors.blue, width: 1),
                              ),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 13, bottom: 13),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat.MMMEd().format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          _schedules[index].startTimestamp!),
                                    ),
                                    style: const TextStyle(color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future showTutorTimePicker(Schedule schedules) {
    List<ScheduleDetailInfo> scheduleDetails = schedules.scheduleDetails!;

    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "Select time",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, bottom: 10),
                      child: GridView.count(
                        crossAxisCount:
                            Helper.generateAsisChildRatio(constraints)[0]
                                .toInt(),
                        childAspectRatio:
                            (1 / Helper.generateAsisChildRatio(constraints)[1]),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        children: List.generate(
                          scheduleDetails.length,
                          (index) => ElevatedButton(
                            onPressed: () async {
                              if (!scheduleDetails[index].isBooked! &&
                                  DateTime.fromMillisecondsSinceEpoch(
                                          scheduleDetails[index]
                                              .startPeriodTimestamp!)
                                      .isAfter(DateTime.now())) {
                                await _handleBookingSchedule(
                                    scheduleDetails, index);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  scheduleDetails[index].isBooked! ||
                                          DateTime.fromMillisecondsSinceEpoch(
                                                  scheduleDetails[index]
                                                      .startPeriodTimestamp!)
                                              .isBefore(DateTime.now())
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).highlightColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                side: BorderSide(color: Colors.blue, width: 1),
                              ),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 13, bottom: 13),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${Helper.timeStampToHoursMinutes(scheduleDetails[index].startPeriodTimestamp!)} - ",
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                  Text(
                                    Helper.timeStampToHoursMinutes(
                                        scheduleDetails[index]
                                            .endPeriodTimestamp!),
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _handleBookingSchedule(
      List<ScheduleDetailInfo> scheduleDetails, int index) async {
    try {
      await LetTutorAPIService.scheDuleAPIService.bookSchedule(
        scheduleDetails[index].id!,
      );

      scheduleDetails[index].isBooked = true;

      showSnackBar("Sucess", "Booking schedule sucess");
    } catch (e) {
      showSnackBar("Failed", e.toString());
    }
  }
}

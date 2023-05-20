// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/schedule.dart';
// import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/small.dart';
// import 'package:let_tutor_mobile/app/modules/booking/booking_view.dart';

// class TimeButton extends StatelessWidget {
//   const TimeButton({
//     Key? key,
//     required this.schedule,
//     required this.teacher,
//   }) : super(key: key);

//   final Schedule schedule;
//   final TutorInfo teacher;
//   @override
//   Widget build(BuildContext context) {
//     ThemeData themeData = Theme.of(context);
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: OutlinedButton(
//         onPressed:
//             (schedule.isBooked! || schedule.scheduleDetails![0].isBooked!)
//                 ? null
//                 : () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => BookingDetailScreen(
//                           schedule: schedule,
//                           teacher: teacher,
//                         ),
//                       ),
//                     );
//                   },
//         style: OutlinedButton.styleFrom(
//           side: BorderSide(
//               color: !schedule.isBooked! ? themeData.primaryColor : Colors.grey,
//               width: 1),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         child: Text(
//           "${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp!))} - ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(schedule.endTimestamp!))}",
//           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//         ),
//       ),
//     );
//   }
// }

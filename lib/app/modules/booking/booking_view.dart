// import 'package:flutter/material.dart';
// import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/schedule.dart';
// import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/small.dart';

// class BookingDetailScreen extends StatelessWidget {
//   const BookingDetailScreen(
//       {Key? key, required this.schedule, required this.teacher})
//       : super(key: key);
//   final Schedule schedule;
//   final TutorInfo teacher;
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController textController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Booking Detail"),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           child: Column(
//             children: [
//               Expanded(
//                 child: Center(
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 30),
//                       OverViewTeacher(
//                         teacher: teacher,
//                       ),
//                       const SizedBox(height: 10),
//                       const Divider(),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             "Booking time:",
//                             style: TextStyle(fontSize: 18),
//                           ).tr(),
//                           Text(
//                             "${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp))} - ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(schedule.endTimestamp))}",
//                             style: const TextStyle(fontSize: 18),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             DateFormat('EE, dd MM yyyy').format(
//                               DateTime.fromMillisecondsSinceEpoch(
//                                 schedule.startTimestamp,
//                               ),
//                             ),
//                             style: const TextStyle(fontSize: 18),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             "Total:",
//                             style: TextStyle(fontSize: 18),
//                           ).tr(),
//                           const Text(
//                             "You have a lesson left",
//                             style: TextStyle(fontSize: 18),
//                           ).tr(),
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Notes:",
//                             style: TextStyle(fontSize: 18),
//                           ).tr(),
//                           const SizedBox(height: 10),
//                           TextField(
//                             keyboardType: TextInputType.multiline,
//                             decoration: InputDecoration(
//                               border: const OutlineInputBorder(),
//                               hintText: tr("Send your message"),
//                             ),
//                             maxLines: null,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             "Cancel",
//                             style: TextStyle(fontSize: 18),
//                           ).tr(),
//                         ],
//                       ),
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.all(defaultPadding),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         primary: Colors.grey,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 30),
//                   Expanded(
//                     child: ElevatedButton(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             "Accept",
//                             style: TextStyle(fontSize: 18),
//                           ).tr(),
//                         ],
//                       ),
//                       onPressed: () async {
//                         String message = await ScheduleAPI().bookAClass(
//                             schedule.scheduleDetails![0].id,
//                             textController.text);
//                         _showMyDialog(context,
//                             title: "Message", message: message);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.all(defaultPadding),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         primary: Colors.green,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _showMyDialog(BuildContext context,
//       {required String title, required String message}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text(message),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Approve'),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

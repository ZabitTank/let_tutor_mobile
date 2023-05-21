import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/booking.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/user_info.dart';
import 'package:let_tutor_mobile/core/utils/helper.dart';

class CallVideo {
  static Timer? _timer;

  static Future<void> joinMeeting(
      {required Booking booking, required MyUserInfo user}) async {
    String decoded = utf8
        .decode(base64.decode(booking.studentMeetingLink?.split(".")[1] ?? ""));

    final map = json.decode(decoded);
    Map<FeatureFlag, Object> featureFlags = {};
    var options = JitsiMeetingOptions(
      roomNameOrUrl: map['room'],
      isAudioMuted: true,
      isAudioOnly: true,
      isVideoMuted: true,
      userDisplayName: user.name ?? "Student",
      userEmail: user.email ?? "student@gmail.com",
      featureFlags: featureFlags,
      userAvatarUrl: user.avatar,
    );

    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
          onOpened: () {
            _timer = Timer.periodic(const Duration(milliseconds: 1000),
                (timer) async {
              if (booking.scheduleDetailInfo!.startPeriodTimestamp! <=
                  DateTime.now().millisecondsSinceEpoch) {
                timer.cancel();
              }
              String strTimeUntil = getUntilTime(Helper.timeStampToDateTime(
                  booking.scheduleDetailInfo!.startPeriodTimestamp!));
              await Fluttertoast.showToast(
                msg: "\n\n$strTimeUntil until lesson start",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.transparent,
                textColor: Colors.white,
                timeInSecForIosWeb: 1,
                fontSize: 18,
              );
              await Fluttertoast.cancel();
            });
          },
          onConferenceWillJoin: (url) {
            debugPrint("onConferenceWillJoin: url: $url");
          },
          onConferenceJoined: (url) {
            debugPrint("onConferenceJoined: url: $url");
            _timer?.cancel();
            _timer = Timer.periodic(const Duration(milliseconds: 1000),
                (timer) async {
              if (booking.scheduleDetailInfo!.startPeriodTimestamp! <=
                  DateTime.now().millisecondsSinceEpoch) {
                timer.cancel();
              }
              String strTimeUntil = getUntilTime(Helper.timeStampToDateTime(
                  booking.scheduleDetailInfo!.startPeriodTimestamp!));
              await Fluttertoast.showToast(
                msg: "\n\n$strTimeUntil until lesson start",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.transparent,
                textColor: Colors.white,
                timeInSecForIosWeb: 1,
                fontSize: 18,
              );
              await Fluttertoast.cancel();
            });
          },
          onConferenceTerminated: (url, error) {
            debugPrint("onConferenceTerminated: url: $url, error: $error");
            _timer?.cancel();
            Fluttertoast.cancel();
          },
          onAudioMutedChanged: (isMuted) {
            debugPrint("onAudioMutedChanged: isMuted: $isMuted");
          },
          onVideoMutedChanged: (isMuted) {
            debugPrint("onVideoMutedChanged: isMuted: $isMuted");
          },
          onScreenShareToggled: (participantId, isSharing) {
            debugPrint(
              "onScreenShareToggled: participantId: $participantId, "
              "isSharing: $isSharing",
            );
          },
          onParticipantJoined: (email, name, role, participantId) {
            debugPrint(
              "onParticipantJoined: email: $email, name: $name, role: $role, "
              "participantId: $participantId",
            );
          },
          onParticipantLeft: (participantId) {
            debugPrint("onParticipantLeft: participantId: $participantId");
          },
          onParticipantsInfoRetrieved: (participantsInfo, requestId) {
            debugPrint(
              "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
              "requestId: $requestId",
            );
          },
          onChatMessageReceived: (senderId, message, isPrivate) {
            debugPrint(
              "onChatMessageReceived: senderId: $senderId, message: $message, "
              "isPrivate: $isPrivate",
            );
          },
          onChatToggled: (isOpen) =>
              debugPrint("onChatToggled: isOpen: $isOpen"),
          onClosed: () async {
            _timer?.cancel();
            await Fluttertoast.cancel();
            debugPrint("onClosed");
          }),
    );
    _timer?.cancel();
  }

  static String getUntilTime(DateTime time) {
    const int HOURS_PER_DAY = 24;
    const int MINUTES_PER_HOUR = 60;
    const int SECONDS_PER_MINUTE = 60;

    final now = DateTime.now();
    final difference = time.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours - days * HOURS_PER_DAY;
    final minutes = difference.inMinutes -
        days * HOURS_PER_DAY * MINUTES_PER_HOUR -
        hours * MINUTES_PER_HOUR;
    final seconds = difference.inSeconds -
        days * HOURS_PER_DAY * MINUTES_PER_HOUR * SECONDS_PER_MINUTE -
        hours * MINUTES_PER_HOUR * SECONDS_PER_MINUTE -
        minutes * SECONDS_PER_MINUTE;
    final hoursStr = hours > 9 ? "$hours" : "0$hours";
    final minutesStr = minutes > 9 ? "$minutes" : "0$minutes";
    final secondsStr = seconds > 9 ? "$seconds" : "0$seconds";
    String daysStr = days > 9
        ? "$days ${"days".tr}"
        : days > 1
            ? "0$days ${"days".tr}"
            : days == 1
                ? "01 ${"day".tr}"
                : "";
    return "$daysStr $hoursStr:$minutesStr:$secondsStr";
  }

// joinMeeting(MyUserInfo user, Booking booking) async {
//   Map<FeatureFlag, Object> featureFlags = {};

//   try {
//     String decoded = utf8
//         .decode(base64.decode(booking.studentMeetingLink?.split(".")[1] ?? ""));

//     final map = json.decode(decoded);

//     var options = JitsiMeetingOptions(
//       roomNameOrUrl: map['room'],
//       isAudioMuted: true,
//       isAudioOnly: true,
//       isVideoMuted: true,
//       userDisplayName: user.name ?? "Student",
//       userEmail: user.email ?? "student@gmail.com",
//       featureFlags: featureFlags,
//       userAvatarUrl: user.avatar,
//     );

//     Timer _timer;
//     await JitsiMeetWrapper.joinMeeting(
//       options: options,
//       listener: JitsiMeetingListener(
//         onOpened: () {
//           _timer =
//               Timer.periodic(const Duration(milliseconds: 1000), (timer) async {
//             if (booking.scheduleDetailInfo!.startPeriodTimestamp! <=
//                 DateTime.now().millisecondsSinceEpoch) {
//               timer.cancel();
//             }
//             String strTimeUntil = getUntilTime(schedule.startPeriodTimestamp!);
//             await Fluttertoast.showToast(
//               msg: "\n\n$strTimeUntil ${"until_lesson_start".tr}",
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.CENTER,
//               backgroundColor: Colors.transparent,
//               textColor: Colors.white,
//               timeInSecForIosWeb: 1,
//               fontSize: 18,
//             );
//             await Fluttertoast.cancel();
//           });
//         },
//         onConferenceWillJoin: (url) {
//           debugPrint("onConferenceWillJoin: url: $url");
//         },
//         onConferenceJoined: (url) {
//           debugPrint("onConferenceJoined: url: $url");
//         },
//         onConferenceTerminated: (url, error) {
//           debugPrint("onConferenceTerminated: url: $url, error: $error");
//         },
//         onAudioMutedChanged: (isMuted) {
//           debugPrint("onAudioMutedChanged: isMuted: $isMuted");
//         },
//         onVideoMutedChanged: (isMuted) {
//           debugPrint("onVideoMutedChanged: isMuted: $isMuted");
//         },
//         onScreenShareToggled: (participantId, isSharing) {
//           debugPrint(
//             "onScreenShareToggled: participantId: $participantId, "
//             "isSharing: $isSharing",
//           );
//         },
//         onParticipantJoined: (email, name, role, participantId) {
//           debugPrint(
//             "onParticipantJoined: email: $email, name: $name, role: $role, "
//             "participantId: $participantId",
//           );
//         },
//         onParticipantLeft: (participantId) {
//           debugPrint("onParticipantLeft: participantId: $participantId");
//         },
//         onParticipantsInfoRetrieved: (participantsInfo, requestId) {
//           debugPrint(
//             "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
//             "requestId: $requestId",
//           );
//         },
//         onChatMessageReceived: (senderId, message, isPrivate) {
//           debugPrint(
//             "onChatMessageReceived: senderId: $senderId, message: $message, "
//             "isPrivate: $isPrivate",
//           );
//         },
//         onChatToggled: (isOpen) => debugPrint("onChatToggled: isOpen: $isOpen"),
//         onClosed: () => debugPrint("onClosed"),
//       ),
//     );
//   } catch (e) {
//     showSnackBar("Error", "Fail to join meeting");
//   }
// }
}

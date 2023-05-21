import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:lettutor_advanced_mobile/app/data/services/profile_service.dart';

import '../../data/models/profile/profile.dart';
import '../../data/models/schedule/schedule.dart';

class JitsiController extends GetxController {
  Timer? _timer;
  final profileService = Get.put(ProfileService());

  Future<void> joinMeeting({
    required Schedule schedule,
  }) async {
    String token = schedule.studentMeetingLink!.split('token=')[1];
    String roomName = "${schedule.studentId}-${schedule.tutorId}";
    Map<FeatureFlag, Object> featureFlags = {};

    Profile? profile = await profileService.getProfile();
    if (profile == null) {
      return;
    }
    // Define meetings options here
    var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,
        serverUrl: "https://meet.lettutor.com",
        token: token,
        isAudioMuted: true,
        isAudioOnly: true,
        isVideoMuted: true,
        userDisplayName: profile.name,
        userEmail: profile.email,
        userAvatarUrl: profile.avatar,
        featureFlags: featureFlags,
        subject: DateFormat("EEE, dd MMM (HH:mm)")
            .format(schedule.startPeriodTimestamp!));

    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
          onOpened: () {
            _timer = Timer.periodic(const Duration(milliseconds: 1000),
                (timer) async {
              if (schedule.startPeriodTimestamp!.millisecondsSinceEpoch <=
                  DateTime.now().millisecondsSinceEpoch) {
                timer.cancel();
              }
              String strTimeUntil =
                  getUntilTime(schedule.startPeriodTimestamp!);
              await Fluttertoast.showToast(
                msg: "\n\n$strTimeUntil ${"until_lesson_start".tr}",
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
              if (schedule.startPeriodTimestamp!.millisecondsSinceEpoch <=
                  DateTime.now().millisecondsSinceEpoch) {
                timer.cancel();
              }
              String strTimeUntil =
                  getUntilTime(schedule.startPeriodTimestamp!);
              await Fluttertoast.showToast(
                msg: "\n\n$strTimeUntil ${"until_lesson_start".tr}",
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
          onClosed: () {
            _timer?.cancel();
            Fluttertoast.cancel();
            debugPrint("onClosed");
          }),
    );
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

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

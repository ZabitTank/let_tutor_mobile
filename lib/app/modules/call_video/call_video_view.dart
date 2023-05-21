import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/booking.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/user_info.dart';

joinMeeting(MyUserInfo user, Booking booking) async {
  Map<FeatureFlag, Object> featureFlags = {};

  String decoded = utf8
      .decode(base64.decode(booking.studentMeetingLink?.split(".")[1] ?? ""));

  final map = json.decode(decoded);

  var options = JitsiMeetingOptions(
    roomNameOrUrl: map['room'],
    isAudioMuted: true,
    isAudioOnly: true,
    isVideoMuted: true,
    userDisplayName: user.name ?? "Student",
    userEmail: user.name ?? "student@gmail.com",
    featureFlags: featureFlags,
    userAvatarUrl: user.avatar,
  );

  await JitsiMeetWrapper.joinMeeting(
    options: options,
    listener: JitsiMeetingListener(
      onOpened: () => debugPrint("onOpened"),
      onConferenceWillJoin: (url) {
        debugPrint("onConferenceWillJoin: url: $url");
      },
      onConferenceJoined: (url) {
        debugPrint("onConferenceJoined: url: $url");
      },
      onConferenceTerminated: (url, error) {
        debugPrint("onConferenceTerminated: url: $url, error: $error");
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
      onChatToggled: (isOpen) => debugPrint("onChatToggled: isOpen: $isOpen"),
      onClosed: () => debugPrint("onClosed"),
    ),
  );
}

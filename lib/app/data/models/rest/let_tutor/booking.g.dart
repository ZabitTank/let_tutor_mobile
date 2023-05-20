// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking()
  ..id = json['id'] as String?
  ..calendarId = json['calendarId']
  ..cancelNote = json['cancelNote']
  ..cancelReasonId = json['cancelReasonId'] as String?
  ..classReview = json['classReview']
  ..scoreByTutor = json['scoreByTutor']
  ..studentRequest = json['studentRequest'] as String?
  ..tutorReview = json['tutorReview']
  ..studentMeetingLink = json['studentMeetingLink'] as String?
  ..tutorMeetingLink = json['tutorMeetingLink'] as String?
  ..feedbacks = (json['feedbacks'] as List<dynamic>?)
      ?.map((e) => Feedback.fromJson(e as Map<String, dynamic>))
      .toList()
  ..scheduleDetailId = json['scheduleDetailId'] as String?
  ..scheduleDetailInfo = json['scheduleDetailInfo'] == null
      ? null
      : ScheduleDetailInfo.fromJson(
          json['scheduleDetailInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'calendarId': instance.calendarId,
      'cancelNote': instance.cancelNote,
      'cancelReasonId': instance.cancelReasonId,
      'classReview': instance.classReview,
      'scoreByTutor': instance.scoreByTutor,
      'studentRequest': instance.studentRequest,
      'tutorReview': instance.tutorReview,
      'studentMeetingLink': instance.studentMeetingLink,
      'tutorMeetingLink': instance.tutorMeetingLink,
      'feedbacks': instance.feedbacks,
      'scheduleDetailId': instance.scheduleDetailId,
      'scheduleDetailInfo': instance.scheduleDetailInfo,
    };

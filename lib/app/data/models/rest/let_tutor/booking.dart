import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/feedback.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/schedule.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  Booking();

  String? id;
  dynamic calendarId;
  dynamic cancelNote;
  String? cancelReasonId;
  dynamic classReview;
  dynamic scoreByTutor;
  String? studentRequest;
  dynamic tutorReview;

  String? studentMeetingLink;
  String? tutorMeetingLink;

  List<Review>? feedbacks;

  String? scheduleDetailId;
  ScheduleDetailInfo? scheduleDetailInfo;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
  Map<String, dynamic> toJson() => _$BookingToJson(this);
}

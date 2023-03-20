import 'package:json_annotation/json_annotation.dart';

part 'feedback.g.dart';

@JsonSerializable()
class Feedback {
  final String? id;
  final String? bookingId;
  // first info is info the one who feed back
  final String? firstId;
  final String? secondId;
  final int? rating;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final FirstInfo? firstInfo;

  Feedback(this.id, this.bookingId, this.firstId, this.secondId, this.rating,
      this.content, this.createdAt, this.updatedAt, this.firstInfo);

  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}

@JsonSerializable()
class FirstInfo {
  final String? level;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  final String? birthday;
  final String? requireNote;
  final int? timezone;
  final String? studySchedule;
  final bool? canSendMessage;
  final String? caredByStaffId;
  final String? studentGroupId;

  FirstInfo(
      this.level,
      this.avatar,
      this.name,
      this.country,
      this.phone,
      this.language,
      this.birthday,
      this.requireNote,
      this.timezone,
      this.studySchedule,
      this.canSendMessage,
      this.caredByStaffId,
      this.studentGroupId);

  factory FirstInfo.fromJson(Map<String, dynamic> json) =>
      _$FirstInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FirstInfoToJson(this);
}

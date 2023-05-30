import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/tutor_info_detail.dart';

part 'schedule.g.dart';

// currenlly not use
@JsonSerializable()
class Schedule {
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  int? startTimestamp;
  int? endTimestamp;
  int? createdAtTimeStamp;
  bool? isBooked;
  List<ScheduleDetailInfo>? scheduleDetails;
  Schedule();
  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

@JsonSerializable()
class ScheduleDetailInfo {
  String? id;
  String? scheduleId;
  ScheduleDetail? scheduleInfo;

  String? endPeriod;
  String? startPeriod;

  int? endPeriodTimestamp;
  int? startPeriodTimestamp;
  bool? isBooked;

  ScheduleDetailInfo();
  factory ScheduleDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDetailInfoToJson(this);
}

@JsonSerializable()
class ScheduleDetail {
  String? id;
  String? date;

  String? startTime;
  String? endTime;

  int? startTimestamp;
  int? endTimeStamp;

  String? tutorId;
  TutorInfoDetail? tutorInfo;
  bool? isBooked;

  ScheduleDetail(this.isBooked);

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDetailToJson(this);
}

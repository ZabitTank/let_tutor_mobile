// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule()
  ..id = json['id'] as String?
  ..tutorId = json['tutorId'] as String?
  ..startTime = json['startTime'] as String?
  ..endTime = json['endTime'] as String?
  ..startTimestamp = json['startTimestamp'] as int?
  ..endTimestamp = json['endTimestamp'] as int?
  ..createdAtTimeStamp = json['createdAtTimeStamp'] as int?
  ..isBooked = json['isBooked'] as bool?
  ..scheduleDetails = (json['scheduleDetails'] as List<dynamic>?)
      ?.map((e) => ScheduleDetailInfo.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'id': instance.id,
      'tutorId': instance.tutorId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'createdAtTimeStamp': instance.createdAtTimeStamp,
      'isBooked': instance.isBooked,
      'scheduleDetails': instance.scheduleDetails,
    };

ScheduleDetailInfo _$ScheduleDetailInfoFromJson(Map<String, dynamic> json) =>
    ScheduleDetailInfo()
      ..id = json['id'] as String?
      ..scheduleId = json['scheduleId'] as String?
      ..scheduleInfo = json['scheduleInfo'] == null
          ? null
          : ScheduleDetail.fromJson(
              json['scheduleInfo'] as Map<String, dynamic>)
      ..endPeriod = json['endPeriod'] as String?
      ..startPeriod = json['startPeriod'] as String?
      ..endPeriodTimestamp = json['endPeriodTimestamp'] as int?
      ..startPeriodTimestamp = json['startPeriodTimestamp'] as int?
      ..isBooked = json['isBooked'] as bool?;

Map<String, dynamic> _$ScheduleDetailInfoToJson(ScheduleDetailInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scheduleId': instance.scheduleId,
      'scheduleInfo': instance.scheduleInfo,
      'endPeriod': instance.endPeriod,
      'startPeriod': instance.startPeriod,
      'endPeriodTimestamp': instance.endPeriodTimestamp,
      'startPeriodTimestamp': instance.startPeriodTimestamp,
      'isBooked': instance.isBooked
    };

ScheduleDetail _$ScheduleDetailFromJson(Map<String, dynamic> json) =>
    ScheduleDetail(
      json['isBooked'] as bool?,
    )
      ..id = json['id'] as String?
      ..date = json['date'] as String?
      ..startTime = json['startTime'] as String?
      ..endTime = json['endTime'] as String?
      ..startTimestamp = json['startTimestamp'] as int?
      ..endTimeStamp = json['endTimeStamp'] as int?
      ..tutorId = json['tutorId'] as String?
      ..tutorInfo = json['tutorInfo'] == null
          ? null
          : TutorInfoDetail.fromJson(json['tutorInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$ScheduleDetailToJson(ScheduleDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'startTimestamp': instance.startTimestamp,
      'endTimeStamp': instance.endTimeStamp,
      'tutorId': instance.tutorId,
      'tutorInfo': instance.tutorInfo,
      'isBooked': instance.isBooked,
    };

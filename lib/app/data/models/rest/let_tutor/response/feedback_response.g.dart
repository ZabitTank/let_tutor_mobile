// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbacksResponse _$FeedbacksResponseFromJson(Map<String, dynamic> json) =>
    FeedbacksResponse(
      count: json['count'] as int,
      rows: (json['rows'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedbacksResponseToJson(FeedbacksResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };

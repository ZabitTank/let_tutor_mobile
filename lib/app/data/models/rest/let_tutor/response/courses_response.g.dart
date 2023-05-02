// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCoursesResponse _$GetCoursesResponseFromJson(Map<String, dynamic> json) =>
    GetCoursesResponse(
      rows: (json['rows'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int,
    );

Map<String, dynamic> _$GetCoursesResponseToJson(GetCoursesResponse instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'count': instance.count,
    };

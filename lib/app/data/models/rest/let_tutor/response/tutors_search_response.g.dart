// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutors_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorsSearchResponse _$TutorsSearchResponseFromJson(
        Map<String, dynamic> json) =>
    TutorsSearchResponse(
      rows: (json['rows'] as List<dynamic>)
          .map((e) => TutorInfoDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int,
    );

Map<String, dynamic> _$TutorsSearchResponseToJson(
        TutorsSearchResponse instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'count': instance.count,
    };

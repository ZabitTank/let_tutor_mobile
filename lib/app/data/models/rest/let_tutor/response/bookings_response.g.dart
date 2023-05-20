// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingsResponse _$BookingsResponseFromJson(Map<String, dynamic> json) =>
    BookingsResponse(
      rows: (json['rows'] as List<dynamic>)
          .map((e) => Booking.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int,
    );

Map<String, dynamic> _$BookingsResponseToJson(BookingsResponse instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'count': instance.count,
    };

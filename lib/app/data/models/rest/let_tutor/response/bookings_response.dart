import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/booking.dart';

part 'bookings_response.g.dart';

@JsonSerializable()
class BookingsResponse {
  final List<Booking> rows;
  final int count;
  BookingsResponse({
    required this.rows,
    required this.count,
  });

  factory BookingsResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookingsResponseToJson(this);
}

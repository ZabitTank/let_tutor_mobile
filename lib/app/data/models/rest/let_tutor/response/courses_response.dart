import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/course.dart';

part 'courses_response.g.dart';

@JsonSerializable()
class GetCoursesResponse {
  final List<Course> rows;
  final int count;
  GetCoursesResponse({
    required this.rows,
    required this.count,
  });

  factory GetCoursesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCoursesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCoursesResponseToJson(this);
}

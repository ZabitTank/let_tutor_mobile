import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? level;
  final String? reason;
  final String? purpose;
  final String? otherDetails;
  final int? defaultPrice;
  final int? coursePrice;
  final String? courseType;
  final String? sectionType;
  final bool? visible;
  final int? displayOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final TutorCourse? tutorCourse;

  Course(
      this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.level,
      this.reason,
      this.purpose,
      this.otherDetails,
      this.defaultPrice,
      this.coursePrice,
      this.courseType,
      this.sectionType,
      this.visible,
      this.displayOrder,
      this.createdAt,
      this.updatedAt,
      this.tutorCourse);

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class TutorCourse {
  final String? userId;
  final String? courseId;

  TutorCourse(this.userId, this.courseId);

  factory TutorCourse.fromJson(Map<String, dynamic> json) =>
      _$TutorCourseFromJson(json);
  Map<String, dynamic> toJson() => _$TutorCourseToJson(this);
}

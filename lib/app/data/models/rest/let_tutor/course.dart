// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/small.dart';

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
  final String? other_details;
  final int? default_price;
  final int? course_price;
  final String? courseType;
  final String? sectionType;
  final bool? visible;
  final int? displayOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final TutorCourse? tutorCourse;
  final List<Topic>? topics;
  final List<ContentCategory>? categories;

  Course(
      this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.level,
      this.reason,
      this.purpose,
      this.courseType,
      this.sectionType,
      this.visible,
      this.displayOrder,
      this.createdAt,
      this.updatedAt,
      this.tutorCourse,
      this.other_details,
      this.default_price,
      this.course_price,
      this.topics,
      this.categories);

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class Topic {
  final String? id;
  final String? courseId;
  final int? orderCourse;
  final String? name;
  final String? nameFile;
  final int? numberOfPages;
  final String? description;
  final String? videoUrl;
  final String? type;
  final String? createdAt;
  final String? updatedAt;

  Topic(
      {this.id,
      this.courseId,
      this.orderCourse,
      this.name,
      this.nameFile,
      this.numberOfPages,
      this.description,
      this.videoUrl,
      this.type,
      this.createdAt,
      this.updatedAt});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);
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

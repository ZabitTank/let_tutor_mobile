// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      json['id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['imageUrl'] as String?,
      json['level'] as String?,
      json['reason'] as String?,
      json['purpose'] as String?,
      json['courseType'] as String?,
      json['sectionType'] as String?,
      json['visible'] as bool?,
      json['displayOrder'] as int?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['tutorCourse'] == null
          ? null
          : TutorCourse.fromJson(json['tutorCourse'] as Map<String, dynamic>),
      json['other_details'] as String?,
      json['default_price'] as int?,
      json['course_price'] as int?,
      (json['topics'] as List<dynamic>?)
          ?.map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['categories'] as List<dynamic>?)
          ?.map((e) => ContentCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'level': instance.level,
      'reason': instance.reason,
      'purpose': instance.purpose,
      'other_details': instance.other_details,
      'default_price': instance.default_price,
      'course_price': instance.course_price,
      'courseType': instance.courseType,
      'sectionType': instance.sectionType,
      'visible': instance.visible,
      'displayOrder': instance.displayOrder,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'tutorCourse': instance.tutorCourse,
      'topics': instance.topics,
      'categories': instance.categories,
    };

Topic _$TopicFromJson(Map<String, dynamic> json) => Topic(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      orderCourse: json['orderCourse'] as int?,
      name: json['name'] as String?,
      nameFile: json['nameFile'] as String?,
      numberOfPages: json['numberOfPages'] as int?,
      description: json['description'] as String?,
      videoUrl: json['videoUrl'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'orderCourse': instance.orderCourse,
      'name': instance.name,
      'nameFile': instance.nameFile,
      'numberOfPages': instance.numberOfPages,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

TutorCourse _$TutorCourseFromJson(Map<String, dynamic> json) => TutorCourse(
      json['userId'] as String?,
      json['courseId'] as String?,
    );

Map<String, dynamic> _$TutorCourseToJson(TutorCourse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'courseId': instance.courseId,
    };

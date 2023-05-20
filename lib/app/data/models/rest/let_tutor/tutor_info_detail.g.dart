// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_info_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorInfoDetail _$TutorInfoDetailFromJson(Map<String, dynamic> json) =>
    TutorInfoDetail()
      ..level = json['level'] as String?
      ..email = json['email'] as String?
      ..avatar = json['avatar'] as String?
      ..name = json['name'] as String?
      ..country = json['country'] as String?
      ..phone = json['phone'] as String?
      ..language = json['language']
      ..birthday = json['birthday'] as String?
      ..requestPassword = json['requestPassword'] as bool?
      ..isActivated = json['isActivated'] as bool?
      ..isPhoneActivated = json['isPhoneActivated'] as bool?
      ..requireNote = json['requireNote']
      ..timezone = json['timezone'] as int?
      ..phoneAuth = json['phoneAuth']
      ..isPhoneAuthActivated = json['isPhoneAuthActivated'] as bool?
      ..studySchedule = json['studySchedule']
      ..canSendMessage = json['canSendMessage'] as bool?
      ..isPublicRecord = json['isPublicRecord'] as bool?
      ..caredByStaffId = json['caredByStaffId']
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?
      ..deletedAt = json['deletedAt']
      ..studentGroupId = json['studentGroupId']
      ..id = json['id'] as String?
      ..userId = json['userId'] as String?
      ..video = json['video'] as String?
      ..bio = json['bio'] as String?
      ..education = json['education'] as String?
      ..experience = json['experience'] as String?
      ..profession = json['profession'] as String?
      ..accent = json['accent']
      ..targetStudent = json['targetStudent'] as String?
      ..interests = json['interests'] as String?
      ..languages = json['languages'] as String?
      ..specialties = json['specialties'] as String?
      ..resume = json['resume']
      ..rating = (json['rating'] as num?)?.toDouble()
      ..isNative = json['isNative']
      ..schedulestimes = json['schedulestimes'] as String?
      ..isFavorite = json['isFavorite'] as bool?
      ..price = json['price'] as int?
      ..feedbacks = (json['feedbacks'] as List<dynamic>?)
          ?.map((e) => Feedback.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TutorInfoDetailToJson(TutorInfoDetail instance) =>
    <String, dynamic>{
      'level': instance.level,
      'email': instance.email,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'phone': instance.phone,
      'language': instance.language,
      'birthday': instance.birthday,
      'requestPassword': instance.requestPassword,
      'isActivated': instance.isActivated,
      'isPhoneActivated': instance.isPhoneActivated,
      'requireNote': instance.requireNote,
      'timezone': instance.timezone,
      'phoneAuth': instance.phoneAuth,
      'isPhoneAuthActivated': instance.isPhoneAuthActivated,
      'studySchedule': instance.studySchedule,
      'canSendMessage': instance.canSendMessage,
      'isPublicRecord': instance.isPublicRecord,
      'caredByStaffId': instance.caredByStaffId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'studentGroupId': instance.studentGroupId,
      'id': instance.id,
      'userId': instance.userId,
      'video': instance.video,
      'bio': instance.bio,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'accent': instance.accent,
      'targetStudent': instance.targetStudent,
      'interests': instance.interests,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'resume': instance.resume,
      'rating': instance.rating,
      'isNative': instance.isNative,
      'schedulestimes': instance.schedulestimes,
      'isFavorite': instance.isFavorite,
      'price': instance.price,
      'feedbacks': instance.feedbacks,
    };

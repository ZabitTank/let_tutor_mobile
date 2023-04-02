// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_info_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorInfoDetail _$TutorInfoDetailFromJson(Map<String, dynamic> json) =>
    TutorInfoDetail(
      resume: json['resume'] as String?,
      isActivated: json['isActivated'] as bool?,
      User: json['User'] == null
          ? null
          : MyUserInfo.fromJson(json['User'] as Map<String, dynamic>),
      video: json['video'] as String?,
      bio: json['bio'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      profession: json['profession'] as String?,
      accent: json['accent'] as String?,
      targetStudent: json['targetStudent'] as String?,
      interests: json['interests'] as String?,
      languages: json['languages'] as String?,
      specialties: json['specialties'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      isNative: json['isNative'] as bool?,
      isFavorite: json['isFavorite'] as bool?,
      avgRating: json['avgRating'] as int?,
      totalFeedback: json['totalFeedback'] as int?,
    );

Map<String, dynamic> _$TutorInfoDetailToJson(TutorInfoDetail instance) =>
    <String, dynamic>{
      'video': instance.video,
      'bio': instance.bio,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'accent': instance.accent,
      'targetStudent': instance.targetStudent,
      'interests': instance.interests,
      'languages': instance.languages,
      'resume': instance.resume,
      'rating': instance.rating,
      'specialties': instance.specialties,
      'isActivated': instance.isActivated,
      'isNative': instance.isNative,
      'isFavorite': instance.isFavorite,
      'avgRating': instance.avgRating,
      'totalFeedback': instance.totalFeedback,
      'User': instance.User,
    };

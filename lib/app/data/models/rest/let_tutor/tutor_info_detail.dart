// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/user_info.dart';

part 'tutor_info_detail.g.dart';

@JsonSerializable()
class TutorInfoDetail {
  final String? video;
  final String? bio;
  final String? education;
  final String? experience;
  final String? profession;
  final String? accent;
  final String? targetStudent;
  final String? interests;
  final String? languages;
  final String? resume;
  final double? rating;
  final String? specialties;
  final bool? isActivated;
  final bool? isNative;
  final bool? isFavorite;
  final int? avgRating;
  final int? totalFeedback;
  final MyUserInfo? User;

  TutorInfoDetail({
    this.resume,
    this.isActivated,
    this.User,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.rating,
    this.isNative,
    this.isFavorite,
    this.avgRating,
    this.totalFeedback,
  });

  factory TutorInfoDetail.fromJson(Map<String, dynamic> json) =>
      _$TutorInfoDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TutorInfoDetailToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/model/referral.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/model/small.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  final String? id;
  final String? email;
  final String? name;
  final String? avatar;
  final String? country;
  final String? phone;
  final List<String>? roles;
  final String? language;
  final String? birthday;
  final bool? isActivated;
  final TutorInfo? tutorInfo;
  final WalletInfo? walletInfo;
  final String? requireNote;
  final String? level;
  final List<LearnTopic>? learnTopics;
  final List<String>? testPreparations;
  final bool? isPhoneActivated;
  final int? timezone;
  final ReferralInfo? referralInfo;
  final String? studySchedule;
  final bool? canSendMessage;
  final dynamic studentGroup;
  final dynamic studentInfo;
  final double? avgRating;

  UserInfo({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.tutorInfo,
    this.walletInfo,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.referralInfo,
    this.studySchedule,
    this.canSendMessage,
    this.studentGroup,
    this.studentInfo,
    this.avgRating,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

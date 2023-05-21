import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/course.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/feedback.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/referral.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/small.dart';

part 'user_info.g.dart';

@JsonSerializable()
class MyUserInfo {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  String? birthday;
  bool? isActivated;
  TutorInfo? tutorInfo;
  WalletInfo? walletInfo;
  String? requireNote;
  String? level;
  List<LearnTopic>? learnTopics;
  List<TestPreparation>? testPreparations;
  bool? isPhoneActivated;
  int? timezone;
  ReferralInfo? referralInfo;
  String? studySchedule;
  bool? canSendMessage;

  double? avgRating;
  List<Review>? feedbacks;
  List<Course>? courses;

  MyUserInfo({
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
    this.avgRating,
    this.feedbacks,
    this.courses,
  });

  double? getRating() {
    if (avgRating != null) return avgRating!;

    if (feedbacks != null && feedbacks!.isNotEmpty) {
      var result = feedbacks!.map((m) => m.rating).reduce((a, b) => a + b) /
          feedbacks!.length;
      return result;
    }
    return null;
  }

  factory MyUserInfo.fromJson(Map<String, dynamic> json) =>
      _$MyUserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MyUserInfoToJson(this);

  void updateValues(MyUserInfo other) {
    if (other.id != null || id == null) {
      id = other.id;
    }
    if (other.email != null || email == null) {
      email = other.email;
    }
    if (other.name != null || name == null) {
      name = other.name;
    }
    if (other.avatar != null || avatar == null) {
      avatar = other.avatar;
    }
    if (other.country != null || country == null) {
      country = other.country;
    }
    if (other.phone != null || phone == null) {
      phone = other.phone;
    }
    if (other.roles != null || roles == null) {
      roles = other.roles;
    }
    if (other.language != null || language == null) {
      language = other.language;
    }
    if (other.birthday != null || birthday == null) {
      birthday = other.birthday;
    }
    if (other.isActivated != null || isActivated == null) {
      isActivated = other.isActivated;
    }
    if (other.tutorInfo != null || tutorInfo == null) {
      tutorInfo = other.tutorInfo;
    }
    if (other.walletInfo != null || walletInfo == null) {
      walletInfo = other.walletInfo;
    }
    if (other.requireNote != null || requireNote == null) {
      requireNote = other.requireNote;
    }
    if (other.level != null || level == null) {
      level = other.level;
    }
    if (other.learnTopics != null || learnTopics == null) {
      learnTopics = other.learnTopics;
    }
    if (other.testPreparations != null || testPreparations == null) {
      testPreparations = other.testPreparations;
    }
    if (other.isPhoneActivated != null || isPhoneActivated == null) {
      isPhoneActivated = other.isPhoneActivated;
    }
    if (other.timezone != null || timezone == null) {
      timezone = other.timezone;
    }
    if (other.referralInfo != null || referralInfo == null) {
      referralInfo = other.referralInfo;
    }
    if (other.studySchedule != null || studySchedule == null) {
      studySchedule = other.studySchedule;
    }
    if (other.canSendMessage != null || canSendMessage == null) {
      canSendMessage = other.canSendMessage;
    }

    if (other.avgRating != null || avgRating == null) {
      avgRating = other.avgRating;
    }
    if (other.feedbacks != null || feedbacks == null) {
      feedbacks = other.feedbacks;
    }
    if (other.courses != null || courses == null) {
      courses = other.courses;
    }
  }
}

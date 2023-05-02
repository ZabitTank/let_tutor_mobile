// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/user_info.dart';

part 'small.g.dart';

@JsonSerializable()
class TutorInfo {
  final String? id;
  final String? userId;
  final String? video;
  final String? bio;
  final String? education;
  final String? experience;
  final String? profession;
  final String? accent;
  final String? targetStudent;
  final String? interests;
  final String? languages;
  final String? specialties;
  final String? resume;
  final double? rating;
  final bool? isActivated;
  final bool? isNative;
  final MyUserInfo? User;

  TutorInfo({
    this.userId,
    this.User,
    this.id,
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
    this.resume,
    this.rating,
    this.isActivated,
    this.isNative,
  });

  static TutorInfo test = TutorInfo(
    id: "4e14c8e0-fcd5-4746-8004-8d771fe97143",
    userId: "45f8709e-2e84-46f2-b238-817a85cc2b29",
    video:
        "https://api.app.lettutor.com/video/e9e3eeaa-a588-47c4-b4d1-ecfa190f63favideo1632109929663.mp4",
    bio:
        "Hi, My name is Jill I am an experienced English Teacher from Philippine. I would like to share my enthusiasm with the learners in this platform. I've been working with diverse learners of all levels for many years. I am greatly passionate about about profession. I love teaching because I can help others improve their skills and it gives me joy and excitement meeting different learners around the world. In my class I worked with wonderful enthusiasm and positivity, and I'm happy to focus on my learner's goal.",
    education: "Certified at English education",
    experience: "5 years in education",
    profession: "English Teacher",
    accent: null,
    targetStudent: "Beginner",
    interests: "English, Japansese",
    languages: "en,ja",
    specialties: "business-english,english-for-kids,toefl,toeic",
    resume: null,
    rating: 3.75,
    isActivated: true,
    User: MyUserInfo(
        country: "TW",
        name: "Keagen",
        avatar:
            "https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00"),
    isNative: null,
  );

  List<String> toListLanguges() {
    return languages?.split(',') ?? [];
  }

  List<String> toListspecialties() {
    return specialties?.split(',') ?? [];
  }

  factory TutorInfo.fromJson(Map<String, dynamic> json) =>
      _$TutorInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TutorInfoToJson(this);
}

@JsonSerializable()
class LearnTopic {
  final int? id;
  final String? key;
  final String? name;

  LearnTopic({
    this.id,
    this.key,
    this.name,
  });

  factory LearnTopic.fromJson(Map<String, dynamic> json) =>
      _$LearnTopicFromJson(json);
  Map<String, dynamic> toJson() => _$LearnTopicToJson(this);
}

@JsonSerializable()
class TestPreparation {
  final int? id;
  final String? key;
  final String? name;

  TestPreparation({
    this.id,
    this.key,
    this.name,
  });

  factory TestPreparation.fromJson(Map<String, dynamic> json) =>
      _$TestPreparationFromJson(json);
  Map<String, dynamic> toJson() => _$TestPreparationToJson(this);
}

@JsonSerializable()
class ContentCategory {
  final String? id;
  final String? key;
  final String? title;

  ContentCategory({
    this.id,
    this.key,
    this.title,
  });

  factory ContentCategory.fromJson(Map<String, dynamic> json) =>
      _$ContentCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ContentCategoryToJson(this);
}

@JsonSerializable()
class WalletInfo {
  final String? amount;
  final bool? isBlocked;
  final int? bonus;

  WalletInfo({
    this.amount,
    this.isBlocked,
    this.bonus,
  });

  factory WalletInfo.fromJson(Map<String, dynamic> json) =>
      _$WalletInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WalletInfoToJson(this);
}

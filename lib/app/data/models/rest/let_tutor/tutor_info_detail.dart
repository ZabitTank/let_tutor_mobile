import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/feedback.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/user_info.dart';

part 'tutor_info_detail.g.dart';

@JsonSerializable()
class TutorInfoDetail {
  String? level;
  String? email;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  dynamic language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  dynamic requireNote;
  int? timezone;
  dynamic phoneAuth;
  bool? isPhoneAuthActivated;
  dynamic studySchedule;
  bool? canSendMessage;
  bool? isPublicRecord;
  dynamic caredByStaffId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic studentGroupId;
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  dynamic accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  dynamic resume;
  double? rating;
  dynamic isNative;
  String? schedulestimes;
  bool? isFavorite;
  String? isfavoritetutor;
  int? price;
  // ignore: non_constant_identifier_names
  MyUserInfo? User;
  List<Review>? feedbacks;

  TutorInfoDetail();

  List<String> toListLanguges() {
    return languages?.split(',') ?? [];
  }

  List<String> toListspecialties() {
    return specialties?.split(',') ?? [];
  }

  factory TutorInfoDetail.fromJson(Map<String, dynamic> json) =>
      _$TutorInfoDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TutorInfoDetailToJson(this);
}

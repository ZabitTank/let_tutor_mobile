import 'package:json_annotation/json_annotation.dart';

part 'referral.g.dart';

@JsonSerializable()
class ReferralInfo {
  final String? referralCode;
  final ReferralPackInfo? referralPackInfo;

  ReferralInfo({
    this.referralCode,
    this.referralPackInfo,
  });

  factory ReferralInfo.fromJson(Map<String, dynamic> json) =>
      _$ReferralInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ReferralInfoToJson(this);
}

@JsonSerializable()
class ReferralPackInfo {
  final int? earnPercent;

  ReferralPackInfo({
    this.earnPercent,
  });

  factory ReferralPackInfo.fromJson(Map<String, dynamic> json) =>
      _$ReferralPackInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ReferralPackInfoToJson(this);
}

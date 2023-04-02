// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralInfo _$ReferralInfoFromJson(Map<String, dynamic> json) => ReferralInfo(
      referralCode: json['referralCode'] as String?,
      referralPackInfo: json['referralPackInfo'] == null
          ? null
          : ReferralPackInfo.fromJson(
              json['referralPackInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReferralInfoToJson(ReferralInfo instance) =>
    <String, dynamic>{
      'referralCode': instance.referralCode,
      'referralPackInfo': instance.referralPackInfo,
    };

ReferralPackInfo _$ReferralPackInfoFromJson(Map<String, dynamic> json) =>
    ReferralPackInfo(
      earnPercent: json['earnPercent'] as int?,
    );

Map<String, dynamic> _$ReferralPackInfoToJson(ReferralPackInfo instance) =>
    <String, dynamic>{
      'earnPercent': instance.earnPercent,
    };

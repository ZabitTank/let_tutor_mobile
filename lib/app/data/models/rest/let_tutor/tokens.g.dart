// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tokens _$TokensFromJson(Map<String, dynamic> json) => Tokens(
      access: Access.fromJson(json['access'] as Map<String, dynamic>),
      refresh: Refresh.fromJson(json['refresh'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokensToJson(Tokens instance) => <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

Access _$AccessFromJson(Map<String, dynamic> json) => Access(
      token: json['token'] as String,
      expires: json['expires'] as String,
    );

Map<String, dynamic> _$AccessToJson(Access instance) => <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires,
    };

Refresh _$RefreshFromJson(Map<String, dynamic> json) => Refresh(
      token: json['token'] as String,
      expires: json['expires'] as String,
    );

Map<String, dynamic> _$RefreshToJson(Refresh instance) => <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires,
    };

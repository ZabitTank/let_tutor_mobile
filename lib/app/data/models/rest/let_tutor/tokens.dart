import 'package:json_annotation/json_annotation.dart';

part 'tokens.g.dart';

@JsonSerializable()
class Tokens {
  final Access access;
  final Refresh refresh;

  Tokens({
    required this.access,
    required this.refresh,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
  Map<String, dynamic> toJson() => _$TokensToJson(this);
}

@JsonSerializable()
class Access {
  final String token;
  final String expires;

  Access({
    required this.token,
    required this.expires,
  });

  factory Access.fromJson(Map<String, dynamic> json) => _$AccessFromJson(json);
  Map<String, dynamic> toJson() => _$AccessToJson(this);
}

@JsonSerializable()
class Refresh {
  final String token;
  final String expires;

  Refresh({
    required this.token,
    required this.expires,
  });

  factory Refresh.fromJson(Map<String, dynamic> json) =>
      _$RefreshFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshToJson(this);
}

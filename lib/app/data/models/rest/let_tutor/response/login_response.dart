import 'package:json_annotation/json_annotation.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/tokens.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/user_info.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final MyUserInfo user;
  final Tokens tokens;
  LoginResponse({
    required this.user,
    required this.tokens,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

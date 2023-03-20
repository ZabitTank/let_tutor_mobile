class AuthenAPIService {
  final String authDomain;
  final String verifyDomain;

  AuthenAPIService(this.authDomain, this.verifyDomain);
}

class AuthenAPIPaths {
  static const String login = "/login";
  static const String register = "/register";
  static const String registerByPhone = "/phone-register";
  static const String changePassword = "/change-password";
  static const String verifyEmail = "/verifyAccount";

  // what the ...
  static const String notAuthButAuth1 = "/phone-auth-verify/activate";
  static const String notAuthButAuth2 = "/phone-auth-verify/create";
}

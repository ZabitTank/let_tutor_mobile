class UserAPIService {
  final String domain;

  UserAPIService(this.domain);
}

class UserAPIPath {
  static const String tokenedUser = "/info";
  static const String getList = "/forgotPassword";
  static const String search = "/search";
  static const String feedbackTutor = "/feedbackTutor";
  static const String favorite = "/manageFavoriteTutor";
}

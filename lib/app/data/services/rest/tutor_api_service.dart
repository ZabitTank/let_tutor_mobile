class TutorAPIService {
  final String domain;

  TutorAPIService(this.domain);
}

class TutorAPIPath {
  static const String register = "/register";
  static const String getList = "/more";
  static const String search = "/search";

  static String getTutorById(String tutorId) => "/$tutorId";
}

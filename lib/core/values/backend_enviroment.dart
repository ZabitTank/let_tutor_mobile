class BackendEnviroment {
  static String letTutorUrl = "https://sandbox.api.lettutor.com";
  static String openaiUrl = "https://api.openai.com/v1";

  static checkDevelopmentMode() {
    assert(() {
      letTutorUrl = "https://sandbox.api.lettutor.com";
      openaiUrl = "https://api.openai.com/v1";
      return true;
    }());
  }
}

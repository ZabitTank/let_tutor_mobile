import 'package:let_tutor_mobile/app/data/services/rest/authen_api_service.dart';
import 'package:let_tutor_mobile/app/data/services/rest/course_api_service.dart';
import 'package:let_tutor_mobile/app/data/services/rest/schedule_api_service.dart';
import 'package:let_tutor_mobile/app/data/services/rest/tutor_api_service.dart';
import 'package:let_tutor_mobile/app/data/services/rest/user_api_service.dart';
import 'package:let_tutor_mobile/app/data/services/rest/value_api_service.dart';
import 'package:let_tutor_mobile/core/values/backend_enviroment.dart';

class LetTutorAPIService {
  static final authenAPIService = AuthenAPIService(
      "${BackendEnviroment.letTutorUrl}/auth",
      "${BackendEnviroment.letTutorUrl}/verify");

  static final courAPIService =
      CourseAPIService("${BackendEnviroment.letTutorUrl}/course");

  static final scheDuleAPIService = ScheduleAPIService(
      "${BackendEnviroment.letTutorUrl}/booking",
      "${BackendEnviroment.letTutorUrl}/schedule");

  static final tutorAPIService =
      TutorAPIService("${BackendEnviroment.letTutorUrl}/tutor");

  static final userAPIService =
      UserAPIService("${BackendEnviroment.letTutorUrl}/user");

  static const valueAPIService = ValueAPIService();
}

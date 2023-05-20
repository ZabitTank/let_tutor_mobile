import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/schedule.dart';
import 'package:let_tutor_mobile/app/data/providers/api_provider.dart';

class ScheduleAPIService {
  final String bookingDomain;
  final String scheduleDomain;

  Future<Schedule> getScheduleByTutorId(String id) async {
    try {
      final requestBody = {"tutorId": id};

      final response = await RestAPIProvider.instance.request(
        endpoint: scheduleDomain,
        body: requestBody,
        method: HttpMethod.POST,
        useToken: true,
      );
      return Schedule.fromJson(response.data['data']);
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow;
    }
  }

  ScheduleAPIService(this.bookingDomain, this.scheduleDomain);
}

class SheduleAPIPaths {
  static const String getBookedClass = "/list/student";
  static String updateBooked(String bookId) => "/student-request/$bookId";
}

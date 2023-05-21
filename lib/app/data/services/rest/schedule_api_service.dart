import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/bookings_response.dart';
import 'package:let_tutor_mobile/app/data/providers/api_provider.dart';

class ScheduleAPIService {
  final String bookingDomain;
  final String scheduleDomain;

  // Future<Schedule> getScheduleByTutorId(String id) async {
  //   try {
  //     final requestBody = {"tutorId": id};

  //     final response = await RestAPIProvider.instance.request(
  //       endpoint: scheduleDomain,
  //       body: requestBody,
  //       method: HttpMethod.POST,
  //       useToken: true,
  //     );
  //     return Schedule.fromJson(response.data['data']);
  //   } catch (e, stack) {
  //     FirebaseCrashlytics.instance.recordError(e, stack);
  //     rethrow;
  //   }
  // }

  Future<void> studentRequest(String bookingId, String request) async {
    try {
      var requestBody = {"studentRequest": request};

      await RestAPIProvider.instance.request(
          endpoint: "$bookingDomain/student-request/$bookingId",
          method: HttpMethod.POST,
          body: requestBody);
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow;
    }
  }

  Future<void> deleteBooking(
      String scheduleDetailId, String cancelReasonId, String note) async {
    try {
      var requestBody = {
        "scheduleDetailId": scheduleDetailId,
        "cancelInfo": {
          "cancelReasonId": cancelReasonId,
          "note": note,
        }
      };

      await RestAPIProvider.instance.delete(
          endpoint: "$bookingDomain/schedule-detail/",
          body: jsonEncode(requestBody),
          useToken: true);
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow;
    }
  }

  Future<BookingsResponse> bookingHistory({
    bool isOld = true,
    required int page,
    required int perPage,
  }) async {
    try {
      var query = {
        "page": page,
        "perPage": perPage,
        "orderBy": "meeting",
      };

      if (isOld) {
        query['sortBy'] = "desc";
        query['dateTimeLte'] = DateTime.now().millisecondsSinceEpoch;
      } else {
        query['sortBy'] = "asc";
        query['dateTimeGte'] = DateTime.now()
            .subtract(const Duration(minutes: 30))
            .millisecondsSinceEpoch;
      }
      final response = await RestAPIProvider.instance.request(
        endpoint: bookingDomain + SheduleAPIPaths.getBookedClass,
        method: HttpMethod.GET,
        useToken: true,
        query: query,
      );

      final result = BookingsResponse.fromJson(response.data['data']);

      return result;
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

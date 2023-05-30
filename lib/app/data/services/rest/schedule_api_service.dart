import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/booking.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/bookings_response.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/schedule.dart';
import 'package:let_tutor_mobile/app/data/providers/api_provider.dart';

class ScheduleAPIService {
  final String bookingDomain;
  final String scheduleDomain;

  Future<void> bookSchedule(String scheduleDetailid) async {
    try {
      final List<String> list = [scheduleDetailid];
      final requestBody = {
        "scheduleDetailIds": list,
      };

      await RestAPIProvider.instance.request(
          endpoint: bookingDomain,
          method: HttpMethod.POST,
          useToken: true,
          body: requestBody);
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow;
    }
  }

  Future<List<Schedule>> getTutorScheduleV2(String tutorId, int page) async {
    try {
      var requestQuery = {
        "tutorId": tutorId,
        "page": page,
      };

      final response = await RestAPIProvider.instance.request(
          endpoint: scheduleDomain,
          method: HttpMethod.GET,
          useToken: true,
          query: requestQuery);

      final listData = response.data['scheduleOfTutor'] as List;

      final scheduleList = listData.map((e) => Schedule.fromJson(e)).toList();

      final filterScheduleList = scheduleList.where((schedule) {
        final now = DateTime.now();
        final startTime =
            DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp!);
        return startTime.isAfter(now);
      }).toList();

      filterScheduleList
          .sort((s1, s2) => s1.startTimestamp!.compareTo(s2.startTimestamp!));

      List<Schedule> result = [];

      for (int index = 0; index < filterScheduleList.length; index++) {
        if (filterScheduleList[index].startTimestamp == null) continue;

        bool isExist = false;

        for (int index_2 = 0; index_2 < result.length; index_2++) {
          final DateTime first = DateTime.fromMillisecondsSinceEpoch(
              filterScheduleList[index].startTimestamp!);
          final DateTime second = DateTime.fromMillisecondsSinceEpoch(
              result[index_2].startTimestamp!);
          if (first.day == second.day &&
              first.month == second.month &&
              first.year == second.year) {
            result[index_2]
                .scheduleDetails!
                .addAll(filterScheduleList[index].scheduleDetails!);
            isExist = true;
            break;
          }
        }

        if (!isExist) {
          result.add(filterScheduleList[index]);
        }
      }

      for (int index = 0; index < result.length; index++) {
        result[index].scheduleDetails?.sort((s1, s2) => DateTime
                .fromMillisecondsSinceEpoch(s1.startPeriodTimestamp!)
            .compareTo(
                DateTime.fromMillisecondsSinceEpoch(s2.startPeriodTimestamp!)));
      }

      return result;
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow;
    }
  }

  Future<List<Schedule>> getTutorSchedule(String tutorId) async {
    try {
      var requestBody = {"tutorId": tutorId};

      final response = await RestAPIProvider.instance.request(
          endpoint: scheduleDomain,
          method: HttpMethod.POST,
          useToken: true,
          body: requestBody);

      final listData = response.data['data'] as List;

      final scheduleList = listData.map((e) => Schedule.fromJson(e)).toList();

      final filterScheduleList = scheduleList.where((schedule) {
        final now = DateTime.now();
        final startTime =
            DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp!);
        return startTime.isAfter(now);
      }).toList();

      filterScheduleList
          .sort((s1, s2) => s1.startTimestamp!.compareTo(s2.startTimestamp!));

      List<Schedule> result = [];

      for (int index = 0; index < filterScheduleList.length; index++) {
        if (filterScheduleList[index].startTimestamp == null) continue;

        bool isExist = false;

        for (int index_2 = 0; index_2 < result.length; index_2++) {
          final DateTime first = DateTime.fromMillisecondsSinceEpoch(
              filterScheduleList[index].startTimestamp!);
          final DateTime second = DateTime.fromMillisecondsSinceEpoch(
              result[index_2].startTimestamp!);
          if (first.day == second.day &&
              first.month == second.month &&
              first.year == second.year) {
            result[index_2]
                .scheduleDetails!
                .addAll(filterScheduleList[index].scheduleDetails!);
            isExist = true;
            break;
          }
        }

        if (!isExist) {
          result.add(filterScheduleList[index]);
        }
      }

      for (int index = 0; index < result.length; index++) {
        result[index].scheduleDetails?.sort((s1, s2) => DateTime
                .fromMillisecondsSinceEpoch(s1.startPeriodTimestamp!)
            .compareTo(
                DateTime.fromMillisecondsSinceEpoch(s2.startPeriodTimestamp!)));
      }

      return result;
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow;
    }
  }

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

      final response = await RestAPIProvider.instance.delete(
          endpoint: "$bookingDomain/schedule-detail",
          body: requestBody,
          useToken: true);

      if (response.statusCode != 200) {
        return Future.error("Faild to cancel booking");
      }
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow;
    }
  }

  Future<Booking?> next() async {
    try {
      var now = DateTime.now().millisecondsSinceEpoch;
      final query = {"dateTime": now};
      final response = await RestAPIProvider.instance.request(
        endpoint: "$bookingDomain/next",
        method: HttpMethod.GET,
        useToken: true,
        query: query,
      );

      final result = <Booking>[];
      if (response.data['data'] == null || response.data['data'] == []) {
        return null;
      }
      for (var element in response.data['data'] as List<dynamic>) {
        result.add(Booking.fromJson(element));
      }
      if (result.isEmpty) return null;
      List<Booking> filteredList = result
          .where((e) => e.scheduleDetailInfo!.startPeriodTimestamp! > now)
          .toList();

      final closesSchedule = filteredList.reduce((a, b) =>
          a.scheduleDetailInfo!.startPeriodTimestamp! - now <
                  (b.scheduleDetailInfo!.startPeriodTimestamp! - now)
              ? a
              : b);

      return closesSchedule;
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

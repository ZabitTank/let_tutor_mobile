import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/tutors_search_response.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/tutor_info_detail.dart';
import 'package:let_tutor_mobile/app/data/providers/api_provider.dart';
import 'package:let_tutor_mobile/app/data/services/lettutor_api_service.dart';
import 'package:let_tutor_mobile/core/utils/helper.dart';

class TutorAPIService {
  final String domain;

  Future<TutorsSearchResponse> search({
    DateTime? date,
    TimeOfDay? tutoringTimeAvailableFrom,
    TimeOfDay? tutoringTimeAvailableTo,
    String? specialties,
    required int page,
    required int perPage,
    String? search,
  }) async {
    search ??= "";
    List<String> specialtiesList = [];
    if (specialties != null && specialties != "All") {
      specialtiesList = [specialties];
    }

    var requestBody = {
      "page": page,
      "perPage": perPage,
      "search": search,
      "filters": {
        "date": date?.microsecondsSinceEpoch,
        "specialties": specialtiesList,
        "nationality": {},
        "tutoringTimeAvailable": [
          Helper.timeToMilliseconds(date, tutoringTimeAvailableFrom),
          Helper.timeToMilliseconds(date, tutoringTimeAvailableTo)
        ]
      }
    };

    try {
      List<TutorInfoDetail> favoriteTutors = [];
      if (page == 1) {
        final smartResponse = await RestAPIProvider.instance.request(
            endpoint: "$domain${TutorAPIPath.getList}?perPage=${1}&page=${1}",
            method: HttpMethod.GET,
            useToken: true);

        final notFavoriteTutors = smartResponse.data['favoriteTutor'];

        for (var notFavoriteTutor in notFavoriteTutors) {
          final tutor = TutorInfoDetail.fromJson(
              notFavoriteTutor['secondInfo']['tutorInfo']);
          tutor.isFavorite = true;
          tutor.name = notFavoriteTutor['secondInfo']['name'];
          tutor.avatar = notFavoriteTutor['secondInfo']['avatar'];
          favoriteTutors.add(tutor);
        }
      }

      final response = await RestAPIProvider.instance.request(
          endpoint: domain + TutorAPIPath.search,
          method: HttpMethod.POST,
          body: requestBody,
          useToken: true);

      var result = TutorsSearchResponse.fromJson(response.data);
      List<TutorInfoDetail> mergedList = [
        ...favoriteTutors
      ]; // Create a new list with favoriteTutors

      for (var row in result.rows) {
        if (favoriteTutors.any((tutor) => tutor.id == row.id)) {
          continue;
        }
        mergedList.add(row);
      }

      result.rows = mergedList;
      return result;
    } catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow;
    }
  }

  Future<TutorInfoDetail> getTutorById(String id) async {
    try {
      final response = await RestAPIProvider.instance.request(
          endpoint: "$domain/$id", method: HttpMethod.GET, useToken: true);

      return TutorInfoDetail.fromJson(response.data);
    } catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow;
    }
  }

  TutorAPIService(this.domain);
}

class TutorAPIPath {
  static const String register = "/register";
  static const String getList = "/more";
  static const String search = "/search";

  static String getTutorById(String tutorId) => "/$tutorId";
}

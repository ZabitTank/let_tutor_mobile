import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/small.dart';
import 'package:let_tutor_mobile/app/data/providers/api_provider.dart';
import 'package:let_tutor_mobile/core/values/backend_enviroment.dart';

class ValueAPIService {
  const ValueAPIService();
  Future<List<LearnTopic>> getLearnTopics() async {
    try {
      final response = await RestAPIProvider.instance.request(
          endpoint: "${BackendEnviroment.letTutorUrl}/learn-topic",
          method: HttpMethod.GET,
          useToken: true);

      final learnTopics = (response.data as List<dynamic>)
          .map((e) => LearnTopic.fromJson(e as Map<String, dynamic>))
          .toList();
      return learnTopics;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<TestPreparation>> getTestPreparation() async {
    try {
      final response = await RestAPIProvider.instance.request(
          endpoint: "${BackendEnviroment.letTutorUrl}/test-preparation",
          method: HttpMethod.GET,
          useToken: true);

      final testPrepareations = (response.data as List<dynamic>)
          .map((e) => TestPreparation.fromJson(e as Map<String, dynamic>))
          .toList();
      return testPrepareations;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<ContentCategory>> getContentCategory() async {
    try {
      final response = await RestAPIProvider.instance.request(
          endpoint: "${BackendEnviroment.letTutorUrl}/content-category",
          method: HttpMethod.GET,
          useToken: true);

      final testPrepareations = (response.data['rows'] as List<dynamic>)
          .map((e) => ContentCategory.fromJson(e as Map<String, dynamic>))
          .toList();
      return testPrepareations;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<CancelReason>> getCancelReason() async {
    try {
      final response = await RestAPIProvider.instance.request(
          endpoint: "${BackendEnviroment.letTutorUrl}/booking/cancel-reason",
          method: HttpMethod.GET,
          useToken: true);

      final result = (response.data['rows'] as List<dynamic>)
          .map((e) => CancelReason.fromJson(e as Map<String, dynamic>))
          .toList();
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<int> getTotalMinutesLearning() async {
    try {
      final response = await RestAPIProvider.instance.request(
          endpoint: "${BackendEnviroment.letTutorUrl}/call/total",
          method: HttpMethod.GET,
          useToken: true);

      return response.data['total'];
    } catch (e) {
      return Future.error(e);
    }
  }
}

import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/course.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/courses_response.dart';
import 'package:let_tutor_mobile/app/data/providers/api_provider.dart';
import 'package:let_tutor_mobile/core/values/backend_enviroment.dart';
import 'package:let_tutor_mobile/core/values/exceptions/unexpected_exception.dart';
import 'package:dio/dio.dart' as dio;

class CourseAPIService {
  final String courseDomain;

  const CourseAPIService(this.courseDomain);

  Future<GetCoursesResponse> getCourses({
    int? page = 1,
    int? size = 4,
    String? search,
    List<String>? categoryId,
    List<int>? level,
    String? orderBy = "ASC", // DESC
  }) async {
    try {
      final queryParams = <String, dynamic>{
        "page": page,
        "size": size,
        "q": search,
        "order[]": "level",
        "orderBy[]": orderBy,
        "level[]": level,
        "categoryId[]": categoryId,
      };

      // if (categoryId != null && categoryId.isNotEmpty) {
      //   queryParams["categoryId[]"] = categoryId;
      // }

      // if (level != null && level.isNotEmpty) {
      //   queryParams["level[]"] = level;
      // }

      final response = await RestAPIProvider.instance.request(
          endpoint: courseDomain,
          method: HttpMethod.GET,
          useToken: true,
          query: queryParams);

      return GetCoursesResponse.fromJson(response.data['data']);
    } on UnexpectedException catch (_) {
      rethrow;
    } catch (e) {
      return Future.error(
          ServiceLogicException(context: "Course", debugMessage: e.toString()));
    }
  }

  Future<Course> getCourseById(String courseId) async {
    try {
      final response = await RestAPIProvider.instance.request(
          endpoint: "$courseDomain/$courseId",
          method: HttpMethod.GET,
          useToken: true);

      return Course.fromJson(response.data['data']);
    } catch (_) {
      rethrow;
    }
  }
}

class CoursesAPIPaths {}

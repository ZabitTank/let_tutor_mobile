import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/course.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/response/courses_response.dart';
import 'package:let_tutor_mobile/app/data/providers/api_provider.dart';
import 'package:let_tutor_mobile/core/values/exceptions/unexpected_exception.dart';

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
    String? order = "level",
  }) async {
    try {
      final queryParams = {
        "page": page,
        "size": size,
        "order": order,
        "orderBy": orderBy,
        "level": level,
        "categoryId": categoryId,
        "q": search,
      };

      final response = await RestAPIProvider.instance.request(
          endpoint: courseDomain,
          method: HttpMethod.GET,
          query: queryParams,
          useToken: true);

      return GetCoursesResponse.fromJson(response.data);
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

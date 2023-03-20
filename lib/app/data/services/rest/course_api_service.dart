class CourseAPIService {
  final String courseDomain;
  final String categoryDomain;

  CourseAPIService(this.courseDomain, this.categoryDomain);
}

class CoursesAPIPaths {
  static const String getCategory = "/content-category";
}

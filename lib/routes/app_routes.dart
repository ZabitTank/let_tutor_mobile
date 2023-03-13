abstract class Routes {
  Routes._();
  static const welcome = Paths.welcome;
  static const register = Paths.register;
  static const login = Paths.login;
  static const home = Paths.home;
  static const courses = Paths.courses;
  static const courseLearnTopic = Paths.courseLearnTopic;
  static const courseDetail = Paths.courseDetail;
  static const teachers = Paths.teachers;
  static const teacherDetail = Paths.teacherDetail;
  static const schedules = Paths.schedules;
}

abstract class Paths {
  Paths._();
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const register = '/register';
  static const login = '/login';
  static const home = '/home';
  static const courses = '/courses';
  static const courseDetail = '/course-detail';
  static const courseLearnTopic = '/course-learn-topic';
  static const teachers = '/teachers';
  static const teacherDetail = '/teacher-detail';
  static const schedules = '/schedules';
}

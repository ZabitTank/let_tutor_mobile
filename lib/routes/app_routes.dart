abstract class Routes {
  Routes._();
  static const welcome = Paths.welcome;
  static const register = Paths.register;
  static const login = Paths.login;
  static const home = Paths.home;
  static const courses = Paths.courses;
  static const courseLearnTopic = Paths.coursePdf;
  static const courseDetail = Paths.courseDetail;
  static const coursesHistory = Paths.coursesHistory;
  static const teachers = Paths.teachers;
  static const teacherDetail = Paths.teacherDetail;
  static const schedules = Paths.schedules;
  static const chat = Paths.chat;
  static const profile = Paths.profile;
  static const settings = Paths.settings;
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
  static const coursePdf = '/course-learn-topic';
  static const coursesHistory = '/courses-history';
  static const teachers = '/teachers';
  static const teacherDetail = '/teacher-detail';
  static const schedules = '/schedules';
  static const chat = '/chat';
  static const profile = '/profile';
  static const settings = '/settings';
}

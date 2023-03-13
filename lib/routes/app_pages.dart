import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/course_detail/course_detail_binding.dart';
import 'package:let_tutor_mobile/app/modules/course_detail/course_detail_view.dart';
import 'package:let_tutor_mobile/app/modules/course_history/course_history_binding.dart';
import 'package:let_tutor_mobile/app/modules/course_history/course_history_view.dart';
import 'package:let_tutor_mobile/app/modules/course_learn_topic/course_learn_topic_view.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/courses_binding.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/courses_view.dart';
import 'package:let_tutor_mobile/app/modules/login/login_binding.dart';
import 'package:let_tutor_mobile/app/modules/login/login_view.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_binding.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_view.dart';
import 'package:let_tutor_mobile/app/modules/teacher_detail/teacher_binding.dart';
import 'package:let_tutor_mobile/app/modules/teacher_detail/teacher_view.dart';
import 'package:let_tutor_mobile/app/modules/teachers_list/teachers_binding.dart';
import 'package:let_tutor_mobile/app/modules/teachers_list/tearchers_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.courses;

  static final routes = [
    GetPage(
      name: Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    // GetPage(
    //   name: Paths.register,
    //   page: () => const (),
    //   binding: LoginBinding(),
    // ),
    GetPage(
      name: Paths.courses,
      page: () => const CoursesView(),
      binding: CoursesBinding(),
    ),
    GetPage(
      name: Paths.courseDetail,
      page: () => const CourseDetail(),
      binding: CourseDetailBinding(),
    ),
    GetPage(
      name: Paths.courseLearnTopic,
      page: () => const CourseLearnTopicView(),
      binding: CourseHistoryBinding(),
    ),
    GetPage(
      name: Paths.coursesHistory,
      page: () => const CourseHistoryView(),
      binding: CourseHistoryBinding(),
    ),
    GetPage(
      name: Paths.teachers,
      page: () => const TeachersView(),
      binding: TeachersBinding(),
    ),
    GetPage(
      name: Paths.teacherDetail,
      page: () => const TeacherView(),
      binding: TeacherBinding(),
    ),
    GetPage(
      name: Paths.schedules,
      page: () => const SchedulesView(),
      binding: SchedulesBinding(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/chat/chat_binding.dart';
import 'package:let_tutor_mobile/app/modules/chat/chat_view.dart';
import 'package:let_tutor_mobile/app/modules/course_detail/course_detail_binding.dart';
import 'package:let_tutor_mobile/app/modules/course_detail/course_detail_view.dart';
import 'package:let_tutor_mobile/app/modules/course_history/course_history_binding.dart';
import 'package:let_tutor_mobile/app/modules/course_history/course_history_view.dart';
import 'package:let_tutor_mobile/app/modules/course_learn_topic/course_learn_topic_view.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/courses_binding.dart';
import 'package:let_tutor_mobile/app/modules/courses_list/courses_view.dart';
import 'package:let_tutor_mobile/app/modules/home/home_binding.dart';
import 'package:let_tutor_mobile/app/modules/home/home_view.dart';
import 'package:let_tutor_mobile/app/modules/login/login_binding.dart';
import 'package:let_tutor_mobile/app/modules/login/login_view.dart';
import 'package:let_tutor_mobile/app/modules/profile/profile_binding.dart';
import 'package:let_tutor_mobile/app/modules/profile/profile_view.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_binding.dart';
import 'package:let_tutor_mobile/app/modules/schedules/schedules_view.dart';
import 'package:let_tutor_mobile/app/modules/settings/settings_binding.dart';
import 'package:let_tutor_mobile/app/modules/settings/settings_view.dart';
import 'package:let_tutor_mobile/app/modules/tutor/tutor_binding.dart';
import 'package:let_tutor_mobile/app/modules/tutor/tutor_view.dart';
import 'package:let_tutor_mobile/app/modules/tutors/tutors_binding.dart';
import 'package:let_tutor_mobile/app/modules/tutors/tutors_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

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
      name: Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      bindings: [
        CoursesBinding(),
        TutorsBinding(),
        SchedulesBinding(),
        ChatBinding(),
      ],
    ),
    GetPage(
      name: Paths.chat,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
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
      page: () => const TutorsView(),
      binding: TutorsBinding(),
    ),
    GetPage(
      name: Paths.teacherDetail,
      page: () => const TutorView(),
      binding: TutorBinding(),
    ),
    GetPage(
      name: Paths.schedules,
      page: () => const SchedulesView(),
      binding: SchedulesBinding(),
    ),
    GetPage(
      name: Paths.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Paths.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}

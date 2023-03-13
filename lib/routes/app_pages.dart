// import 'package:driver_app/modules/change_password/change_password_binding.dart';
// import 'package:driver_app/modules/change_password/change_password_view.dart.dart';
// import 'package:driver_app/modules/chat/chat_binding.dart';
// import 'package:driver_app/modules/chat/chat_view.dart';
// import 'package:driver_app/modules/dashboard_page/dashboard_page_binding.dart';
// import 'package:driver_app/modules/dashboard_page/dashboard_page_view.dart';
// import 'package:driver_app/modules/edit_profile/edit_profile_binding.dart';
// import 'package:driver_app/modules/edit_profile/edit_profile_view.dart';
// import 'package:driver_app/modules/forgot_password/forgot_password_binding.dart';
// import 'package:driver_app/modules/forgot_password/forgot_password_view.dart';
// import 'package:driver_app/modules/login/login_binding.dart';
// import 'package:driver_app/modules/login/login_view.dart';
// import 'package:driver_app/modules/password_login/password_login_view.dart';
// import 'package:driver_app/modules/password_login/password_login_binding.dart';
// import 'package:driver_app/modules/password_register/password_binding.dart';
// import 'package:driver_app/modules/password_register/password_view.dart';
// import 'package:driver_app/modules/register/register_view.dart';
// import 'package:driver_app/modules/register/register_binding.dart';
// import 'package:driver_app/modules/otp/otp_view.dart';
// import 'package:driver_app/modules/otp/otp_binding.dart';
// import 'package:driver_app/modules/splash/splash_view.dart';
// import 'package:driver_app/modules/splash/splash_binding.dart';
// import 'package:driver_app/modules/trip_detail/trip_detail_binding.dart';
// import 'package:driver_app/modules/trip_detail/trip_detail_view.dart';
// import 'package:driver_app/modules/trip_info/trip_info_binding.dart';
// import 'package:driver_app/modules/trip_info/trip_info_view.dart';

// import 'package:get/get.dart';
// import '../modules/bank_registration/bank_registration_binding.dart';
// import '../modules/bank_registration/bank_registration_view.dart';
// import '../modules/home/home_binding.dart';
// import '../modules/home/home_view.dart';
// import '../modules/income/income_binding.dart';
// import '../modules/income/income_view.dart';
// import '../modules/request/request_binding.dart';
// import '../modules/request/request_view.dart';
// import '../modules/set_up_profile/set_up_profile_binding.dart';
// import '../modules/set_up_profile/set_up_profile_view.dart';
// import '../modules/user/user_binding.dart';
// import '../modules/user/user_view.dart';
// import '../modules/vehicle_registration/vehicle_registration_binding.dart';
// import '../modules/vehicle_registration/vehicle_registration_view.dart';
// import 'app_routes.dart';

// import 'package:driver_app/modules/welcome/welcome_view.dart';

// class AppPages {
//   AppPages._();

//   static const INITIAL = Routes.WELCOME;

//   static final routes = [
//     GetPage(
//       name: Paths.WELCOME,
//       page: () => const WelcomeView(),
//     ),
//     GetPage(
//       name: Paths.LOGIN,
//       page: () => const LoginView(),
//       binding: LoginBinding(),
//     ),
//     GetPage(
//       name: Paths.REGISTER,
//       page: () => const RegisterView(),
//       binding: RegisterBinding(),
//     ),
//     GetPage(
//       name: Paths.OTP,
//       page: () => const OtpView(),
//       binding: OtpBinding(),
//     ),
//     GetPage(
//       name: Paths.PASSWORD_LOGIN,
//       page: () => const PasswordLoginView(),
//       binding: PasswordLoginBinding(),
//     ),
//     GetPage(
//       name: Paths.PASSWORD_REGISTER,
//       page: () => const PasswordView(),
//       binding: PasswordBinding(),
//     ),
//     GetPage(
//       name: Paths.SPLASH,
//       page: () => const SplashView(),
//       binding: SplashBinding(),
//     ),
//     GetPage(
//       name: Paths.REQUEST,
//       page: () => const RequestView(),
//       binding: RequestBinding(),
//     ),
//     GetPage(
//       name: Paths.USER,
//       page: () => const UserView(),
//       binding: UserBinding(),
//     ),
//     GetPage(
//       name: Paths.CHAT,
//       page: () => const ChatView(),
//       binding: ChatBinding(),
//     ),
//     GetPage(
//       name: Paths.EDIT_PROFILE,
//       page: () => const EditProfileView(),
//       binding: EditProfileBinding(),
//     ),
//     GetPage(
//         name: Paths.DASHBOARD_PAGE,
//         page: () => const DashboardPageView(),
//         binding: DashboardPageBinding(),
//         bindings: [HomeBinding(), IncomeBinding(), ChatBinding()]),
//     GetPage(
//       name: Paths.INCOME,
//       page: () => const IncomeView(),
//       binding: IncomeBinding(),
//     ),
//     GetPage(
//       name: Paths.HOME,
//       page: () => const HomeView(),
//       binding: HomeBinding(),
//     ),
//     GetPage(
//       name: Paths.SET_UP_PROFILE,
//       page: () => const SetUpProfileView(),
//       binding: SetUpProfileBinding(),
//     ),
//     GetPage(
//         name: Paths.VEHICLE_REGISTRATION,
//         page: () => const VehicleRegistrationView(),
//         binding: VehicleRegistrationBinding(),
//         bindings: [
//           RegisterBinding(),
//           PasswordBinding(),
//           SetUpProfileBinding(),
//         ]),
//     GetPage(
//       name: Paths.BANK_REGISTRATION,
//       page: () => const BankRegistrationView(),
//       binding: BankRegistrationBinding(),
//     ),
//     GetPage(
//       name: Paths.PASSWORD_CHANGE,
//       page: () => const ChangePasswordView(),
//       binding: ChangePasswordBinding(),
//     ),
//     GetPage(
//       name: Paths.FORGOT_PASSWORD,
//       page: () => const ForgotPasswordView(),
//       binding: ForgotPasswordBinding(),
//     ),
//     GetPage(
//       name: Paths.TRIP_INFO,
//       page: () => const TripInfoView(),
//       binding: TripInfoBinding(),
//     ),
//     GetPage(
//       name: Paths.TRIP_DETAIL,
//       page: () => const TripDetailView(),
//       binding: TripDetailBinding(),
//     ),
//   ];
// }

import 'package:get/get.dart';

import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/bfr/bindings/bfr_binding.dart';
import '../modules/bfr/views/bfr_view.dart';
import '../modules/bmi/bindings/bmi_binding.dart';
import '../modules/bmi/views/bmi_view.dart';
import '../modules/calculate_calorie/bindings/calculate_calorie_binding.dart';
import '../modules/calculate_calorie/views/calculate_calorie_view.dart';
import '../modules/detector/bindings/detector_binding.dart';
import '../modules/detector/views/detector_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart'; 
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/update_user/bindings/update_user_binding.dart';
import '../modules/update_user/views/update_user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () => const BaseView(),
      bindings: [
        BaseBinding(),
        ProfileBinding(),
        HomeBinding(),
        DetectorBinding(),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_USER,
      page: () => const UpdateUserView(),
      binding: UpdateUserBinding(),
    ),
    GetPage(
      name: _Paths.DETECTOR,
      page: () => const DetectorView(),
      binding: DetectorBinding(),
    ),
    GetPage(
      name: _Paths.CALCULATE_CALORIE,
      page: () => const CalculateCalorieView(),
      binding: CalculateCalorieBinding(),
    ),
    GetPage(
      name: _Paths.BMI,
      page: () => const BmiView(),
      binding: BmiBinding(),
    ),
    GetPage(
      name: _Paths.BFR,
      page: () => const BfrView(),
      binding: BfrBinding(),
    ), 
  ];
}

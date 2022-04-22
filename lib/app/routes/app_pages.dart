import 'package:get/get.dart';

import 'package:zendo_mobile/app/modules/home/bindings/home_binding.dart';
import 'package:zendo_mobile/app/modules/home/views/home_view.dart';
import 'package:zendo_mobile/app/modules/login/bindings/login_binding.dart';
import 'package:zendo_mobile/app/modules/login/views/login_view.dart';
import 'package:zendo_mobile/app/modules/splash/bindings/splash_binding.dart';
import 'package:zendo_mobile/app/modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

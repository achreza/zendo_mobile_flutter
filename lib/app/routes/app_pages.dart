import 'package:get/get.dart';

import 'package:zendo_mobile/app/modules/change-order/bindings/change_order_binding.dart';
import 'package:zendo_mobile/app/modules/change-order/views/change_order_view.dart';
import 'package:zendo_mobile/app/modules/create-order/bindings/create_order_binding.dart';
import 'package:zendo_mobile/app/modules/create-order/views/create_order_view.dart';
import 'package:zendo_mobile/app/modules/detail-order/bindings/detail_order_binding.dart';
import 'package:zendo_mobile/app/modules/detail-order/views/detail_order_complete_view.dart';
import 'package:zendo_mobile/app/modules/detail-order/views/detail_order_view.dart';
import 'package:zendo_mobile/app/modules/home/bindings/home_binding.dart';
import 'package:zendo_mobile/app/modules/home/views/home_tab_view.dart';
import 'package:zendo_mobile/app/modules/login/bindings/login_binding.dart';
import 'package:zendo_mobile/app/modules/login/views/login_view.dart';
import 'package:zendo_mobile/app/modules/riwayat-order/bindings/riwayat_order_binding.dart';
import 'package:zendo_mobile/app/modules/riwayat-order/views/riwayat_order_view.dart';
import 'package:zendo_mobile/app/modules/splash/bindings/splash_binding.dart';
import 'package:zendo_mobile/app/modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

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
      page: () => HomeTabView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ORDER,
      page: () => CreateOrderView(),
      binding: CreateOrderBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ORDER,
      page: () => DetailOrderView(),
      binding: DetailOrderBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ORDER_COMPLETE,
      page: () => DetailOrderCompleteView(),
      binding: DetailOrderBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_ORDER,
      page: () => ChangeOrderView(),
      binding: ChangeOrderBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_ORDER,
      page: () => RiwayatOrderView(),
      binding: RiwayatOrderBinding(),
    ),
  ];
}

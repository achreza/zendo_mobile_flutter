import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<AuthService>(() => AuthService());
  }
}

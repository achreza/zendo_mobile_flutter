import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/providers/profile_provider.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';

import '../../../data/providers/auth_provider.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileProvider>(() => ProfileProvider());
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthService>(() => AuthService());
    Get.put<SplashController>(SplashController());
  }
}

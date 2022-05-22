import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/providers/auth_provider.dart';
import 'package:zendo_mobile/app/data/providers/profile_provider.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<ProfileProvider>(() => ProfileProvider());
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthService>(() => AuthService());
  }
}

import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthService>(() => AuthService());
  }
}

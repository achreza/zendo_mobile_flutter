import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';

class SplashController extends GetxController {
  final AuthService authService = Get.find();

  @override
  void onReady() {
    super.onReady();

    Future.delayed(Duration(seconds: 1), () async {
      if (authService.isLoggedIn) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/login');
      }
    });
  }
}

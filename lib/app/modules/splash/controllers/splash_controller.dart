import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/models/user.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';

class SplashController extends GetxController with StateMixin<User> {
  final AuthService authService = Get.find();

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.loading());

    Future.delayed(Duration(seconds: 2), () async {
      if (authService.isLoggedIn) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/login');
      }
    });
  }
}

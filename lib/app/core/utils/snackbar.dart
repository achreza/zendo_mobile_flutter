import 'package:get/get.dart';

class SnackbarUtil {
  static void show(String message) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      duration: Duration(seconds: 3),
    ));
  }
}

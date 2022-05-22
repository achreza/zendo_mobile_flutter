import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';

class LoginController extends GetxController {
  final RxBool isSubmit = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool passwordVisible = false.obs;

  final RxString phoneNumber = ''.obs;
  final RxString password = ''.obs;

  final RxString errorMessage = ''.obs;

  final AuthService authService = Get.find();

  void login() async {
    if (formKey.currentState!.validate()) {
      isSubmit.value = true;
      errorMessage.value = '';

      try {
        await authService.login(phoneNumber.value, password.value);
        Get.offAllNamed('/home');
      } catch (e) {
        isSubmit.value = false;
        errorMessage.value = e.toString().replaceAll('Exception: ', '');
      }
    }
  }

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }
}

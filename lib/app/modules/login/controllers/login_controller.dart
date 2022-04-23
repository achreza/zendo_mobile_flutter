import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';

class LoginController extends GetxController {
  final RxBool isSubmit = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxString phoneNumber = ''.obs;
  final RxString password = ''.obs;

  final AuthService authService = Get.find();

  void login() {
    // form validation success
    if (formKey.currentState!.validate()) {
      authService.login(phoneNumber.value, password.value);
    }
  }
}

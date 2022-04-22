import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxBool isSubmit = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxString phoneNumber = ''.obs;
  final RxString password = ''.obs;

  void login() {
    // form validation success
    if (formKey.currentState!.validate()) {
      // TODO: do login
      Get.showSnackbar(GetSnackBar(
        message: 'Login Success',
        duration: Duration(seconds: 2),
      ));
    }
  }
}

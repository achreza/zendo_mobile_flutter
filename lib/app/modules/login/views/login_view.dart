import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:zendo_mobile/app/components/alerts/error_alert.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            reverse: true,
            child: Container(
              height: context.height,
              child: Column(
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 90.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _PageTitle(),

                        // Error Alert
                        _LoginErrorAlert(),

                        // Phone Input Field
                        _PhoneInputField(),

                        // Password Input Field
                        _PasswordInputField(),

                        // Login Button
                        _LoginButton(),

                        SizedBox(height: 90.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PageTitle extends StatelessWidget {
  const _PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 3),
      margin: EdgeInsets.only(top: 60.h, bottom: 20.h),
      child: Text('Masuk', style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500)),
    );
  }
}

class _LoginErrorAlert extends StatelessWidget {
  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    if (controller.errorMessage.value.isNotEmpty) {
      return Obx(
        () => Container(
          margin: EdgeInsets.only(bottom: 20.h),
          child: ErrorAlert(message: controller.errorMessage.value),
        ),
      );
    }

    return Container();
  }
}

class _PhoneInputField extends StatelessWidget {
  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nomor HP', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400)),
            SizedBox(height: kDefaultPadding),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan nomor HP..',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) => controller.phoneNumber.value = value,
              validator: Validators.compose([
                Validators.required("Nomer telepon tidak boleh kosong"),
                Validators.patternString(r'^[0-9]{10,13}$', "Nomer telepon tidak valid"),
                Validators.minLength(10, "Nomer telepon tidak valid"),
                Validators.maxLength(13, "Nomer telepon tidak valid"),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Password', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400)),
            SizedBox(height: kDefaultPadding),
            Obx(
              () => TextFormField(
                decoration: InputDecoration(
                  hintText: 'Masukkan kata sandi..',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.passwordVisible.value ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () => controller.togglePasswordVisibility(),
                  ),
                ),
                obscureText: !controller.passwordVisible.value,
                onChanged: (value) => controller.password.value = value,
                validator: Validators.compose([
                  Validators.required("Password tidak boleh kosong"),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.symmetric(horizontal: kDefaultMargin * 3),
        height: 50.h,
        width: double.infinity,
        child: ElevatedButton(
          child: Text('Masuk'),
          onPressed: !controller.isSubmit.value ? controller.login : null,
        ),
      ),
    );
  }
}

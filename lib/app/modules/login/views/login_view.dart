import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 3),
                          child:
                              Text('Masuk', style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(height: 20.h),

                        // Phone Input Field
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nomor HP',
                                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400)),
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
                        SizedBox(height: kDefaultPadding * 2),

                        // Password Input Field
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Password',
                                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400)),
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
                                        controller.passwordVisible.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
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
                        SizedBox(height: kDefaultPadding * 2),

                        // Login Button
                        Obx(
                          () => Container(
                            margin: EdgeInsets.symmetric(horizontal: kDefaultMargin * 3),
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text('Masuk'),
                              onPressed: !controller.isSubmit.value ? controller.login : null,
                            ),
                          ),
                        ),
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

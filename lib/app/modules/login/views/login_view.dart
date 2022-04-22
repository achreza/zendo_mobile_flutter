import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: <Widget>[
              // Phone Input Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => controller.phoneNumber.value = value,
                  maxLength: 13,
                  validator: Validators.compose([
                    Validators.required("Nomer telepon tidak boleh kosong"),
                    Validators.patternString(r'^[0-9]{10,13}$', "Nomer telepon tidak valid"),
                    Validators.minLength(10, "Nomer telepon tidak valid"),
                    Validators.maxLength(13, "Nomer telepon tidak valid"),
                  ]),
                ),
              ),

              // Password Input Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  onChanged: (value) => controller.password.value = value,
                  validator: Validators.required("Password tidak boleh kosong"),
                ),
              ),

              // Login Button
              Container(
                margin: EdgeInsets.all(kDefaultMargin),
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Login'),
                  onPressed: controller.login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.onReady();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/logo-splash.png')),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}

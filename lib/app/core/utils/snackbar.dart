import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackbarUtil {
  static void showError(String message) {
    Get.showSnackbar(
      GetSnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red.withOpacity(.1),
        borderRadius: 12.r,
        borderColor: Colors.red.shade400,
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2, vertical: kDefaultPadding * 2.5),
        margin: EdgeInsets.only(
          bottom: 10.h,
          left: kDefaultPadding * 3,
          right: kDefaultPadding * 3,
        ),
        messageText: Text(
          message,
        ),
        icon: Icon(
          Icons.error,
          color: Colors.red,
        ),
      ),
    );
  }
}

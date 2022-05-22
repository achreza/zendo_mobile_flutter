import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showDefault(String message) {
    Fluttertoast.showToast(msg: message);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/values/constants.dart';

class ErrorAlert extends StatelessWidget {
  final String message;

  const ErrorAlert({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding * 3,
        right: kDefaultPadding * 3,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 2,
        vertical: kDefaultPadding * 2.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.red.shade400,
          width: 1.w,
        ),
        color: Colors.red.withOpacity(.1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          SizedBox(width: kDefaultPadding * 2),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

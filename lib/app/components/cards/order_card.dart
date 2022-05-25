import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/core/utils/text.dart';
import 'package:zendo_mobile/app/routes/app_pages.dart';

import '../../core/values/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Order data;

  @override
  Widget build(BuildContext context) {
    final statusText = data.status == "on-going"
        ? "Dalam Proses"
        : data.status == "cancel"
            ? "Dibatalkan"
            : "Selesai";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultMargin * 3),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.DETAIL_ORDER, arguments: data.id);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultMargin * 2,
            vertical: kDefaultMargin * 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: Colors.grey.shade200, width: 1.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#${data.id}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: Container(
                      child: Text(
                        TextUtil.formatDate(DateTime.parse(data.createdAt!)) + " WIB",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7.h),
              RichText(
                text: TextSpan(
                  text: data.customerName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ' • ',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    TextSpan(text: data.customerAddress),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                TextUtil.toRupiah(data.totalFee!),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 7.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 1.r,
                  ),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

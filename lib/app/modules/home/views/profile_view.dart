import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/modules/home/controllers/home_controller.dart';

class ProfileView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(32, 20, 20, 20).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 56.h,
                  width: 56.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12).r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Achmad Fahreza",
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.w500)),
                      Text("+62983232322",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 32, bottom: 6).r,
              child: Text(
                "Hasil anda hari ini :",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
              )),
          Container(
            height: 72.h,
            decoration: BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "5",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text(
                      "Order",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "15.000",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text(
                      "Omzet",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "12.000",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.green),
                    ),
                    Text(
                      "Untuk Driver",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "3.000",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.yellow),
                    ),
                    Text(
                      "Setoran",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 28).r,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10).r,
                    child: Icon(
                      Icons.history,
                      size: 22.w,
                      color: Colors.grey,
                    )),
                Text(
                  "Riwayat Order",
                  style: TextStyle(fontSize: 18.sp),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10).r,
              child: Divider(thickness: 2)),
          Container(
            margin: EdgeInsets.only(left: 15, top: 16).r,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10).r,
                    child: Icon(
                      Icons.headphones,
                      size: 22.w,
                      color: Colors.grey,
                    )),
                Text(
                  "Hubungi Admin",
                  style: TextStyle(fontSize: 18.sp),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10).r,
              child: Divider(thickness: 2)),
          Container(
            margin: EdgeInsets.only(left: 15, top: 16).r,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10).r,
                    child: Icon(
                      Icons.logout,
                      size: 22.w,
                      color: Colors.grey,
                    )),
                Text(
                  "Keluar",
                  style: TextStyle(fontSize: 18.sp),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10).r,
              child: Divider(thickness: 2)),
        ],
      ),
    );
  }
}

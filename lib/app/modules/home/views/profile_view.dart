import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';
import 'package:zendo_mobile/app/modules/home/controllers/home_controller.dart';

class ProfileView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    print("build profile view");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProfileCard(),
          Container(
            margin: EdgeInsets.only(left: 32, bottom: 6).r,
            child: Text(
              "Hasil anda hari ini :",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
          ),
          _RevenueSegment(),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 2,
              vertical: kDefaultPadding,
            ),
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  title: Text(
                    "Riwayat Order",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                  ),
                  leading: Icon(Icons.history),
                  onTap: () => Get.toNamed('/history'),
                ),
                ListTile(
                  title: Text(
                    "Hubungi Admin",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                  ),
                  leading: Icon(Icons.headset_mic),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Keluar",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                  ),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {},
                ),
              ],
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class _RevenueSegment extends StatelessWidget {
  const _RevenueSegment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: Colors.white),
              ),
              Text(
                "Order",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, color: Colors.white),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "15.000",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: Colors.white),
              ),
              Text(
                "Omzet",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, color: Colors.white),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "12.000",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: Colors.green),
              ),
              Text(
                "Untuk Driver",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, color: Colors.white),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "3.000",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: Colors.yellow),
              ),
              Text(
                "Setoran",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultMargin * 3,
        top: kDefaultMargin * 2,
        bottom: kDefaultMargin * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                Text(
                  "Achmad Fahreza",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "+62983232322",
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

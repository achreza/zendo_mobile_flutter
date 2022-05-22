import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';
import 'package:zendo_mobile/app/modules/home/controllers/home_controller.dart';

class ProfileView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchProfile();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProfileCard(),
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
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                  ),
                  leading: Icon(Icons.history),
                  onTap: () => Get.toNamed('/riwayat-order'),
                ),
                ListTile(
                  title: Text(
                    "Hubungi Admin",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                  ),
                  leading: Icon(Icons.headset_mic),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Keluar",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                  ),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                    controller.logout();
                  },
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
  _RevenueSegment({
    Key? key,
  }) : super(key: key);

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 32, bottom: 6).r,
          child: Text(
            "Hasil anda hari ini :",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          height: 72.h,
          decoration: BoxDecoration(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      _homeController.profile.value?.orderCount.toString() ??
                          '0',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
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
                  Obx(
                    () => Text(
                      _homeController.profile.value?.todayOmzet.toString() ??
                          '0',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
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
                  Obx(
                    () => Text(
                      _homeController.profile.value?.todayIncome.toString() ??
                          '0',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.green),
                    ),
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
                  Obx(
                    () => Text(
                      _homeController.profile.value?.todayDeposit.toString() ??
                          '0',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.yellow),
                    ),
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
      ],
    );
  }
}

class _ProfileCard extends StatelessWidget {
  _ProfileCard({
    Key? key,
  }) : super(key: key);

  final HomeController _controller = Get.find();

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
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 28.w,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => _controller.profile.value == null
                      ? Shimmer(
                          child: Container(
                            width: Get.width * 0.4,
                            height: 24.h,
                            color: Colors.grey.shade100,
                          ),
                        )
                      : Text(
                          _controller.profile.value?.driver?.name ?? "",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
                SizedBox(height: 4.h),
                Obx(
                  () => _controller.profile.value == null
                      ? Shimmer(
                          child: Container(
                            width: Get.width * 0.25,
                            height: 14.h,
                            color: Colors.grey.shade100,
                          ),
                        )
                      : Text(
                          _controller.profile.value?.driver?.phoneNumber ?? "",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

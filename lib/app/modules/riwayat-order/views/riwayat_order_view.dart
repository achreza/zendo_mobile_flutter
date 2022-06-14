import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/components/lists/order_list.dart';

import '../controllers/riwayat_order_controller.dart';

class RiwayatOrderView extends GetView<RiwayatOrderController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchRiwayatOrder();
    controller.fetchProfile();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0).r,
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        height: 300.h,
                        padding: EdgeInsets.all(14).r,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25).r,
                                topRight: Radius.circular(25).r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Informasi",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                                "Order adalah jumlah order yang masuk ke driver dengan berbagai status, baik selesai maupun batal"),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                                "Omzet adalah jumlah ongkos kirim dari order yang telah selesai"),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                                "Untuk Driver adalah jumlah bersih yang didapatkan driver setelah dipotong setoran"),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                                "Setoran adalah jumlah yang disetorkan pada hari ini. Jumlah setoran adalah 20% dari total pendapatan")
                          ],
                        ));
                  },
                );
              },
              icon: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.question_mark,
                    color: Colors.black,
                    size: 20,
                  )))
        ],
        title: Text('Riwayat Order'),
        centerTitle: true,
      ),
      body: controller.obx(
        (_) => Container(
          child: Column(
            children: [_RevenueSegment(), OrderList(data: controller.orders)],
          ),
        ),
        onLoading: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _RevenueSegment extends StatelessWidget {
  _RevenueSegment({
    Key? key,
  }) : super(key: key);

  final RiwayatOrderController _controller = Get.find();

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
              Obx(
                () => Text(
                  _controller.profile.value?.orderCount.toString() ?? '0',
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
                  _controller.profile.value?.todayOmzet.toString() ?? '0',
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
                  _controller.profile.value?.todayIncome.toString() ?? '0',
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
                  _controller.profile.value?.todayDeposit.toString() ?? '0',
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
    );
  }
}

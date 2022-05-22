import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/components/cards/order_card.dart';
import 'package:zendo_mobile/app/components/lists/order_list.dart';

import '../controllers/riwayat_order_controller.dart';

class RiwayatOrderView extends GetView<RiwayatOrderController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchRiwayatOrder();
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
                        height: 250.h,
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
                                "Pendapatan adalah jumlah ongkos kirim dari order yang telah selesai"),
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
              icon: Icon(Icons.question_mark))
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
  const _RevenueSegment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
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
    );
  }
}

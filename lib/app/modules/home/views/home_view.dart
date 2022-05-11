import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zendo_mobile/app/components/buttons/add_order_btn.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/lists/order_list.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.orders.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: kDefaultMargin * 3,
                      vertical: kDefaultMargin * 2,
                    ),
                    child: Text(
                      'Order Hari ini',
                      style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Belum Ada Order',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          SizedBox(height: kDefaultMargin * 2),
                          AddOrderButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: kDefaultMargin * 3,
                        right: kDefaultMargin * 3,
                        top: kDefaultMargin * 2,
                      ),
                      child: Text(
                        'Order Hari ini',
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Order Aktif',
                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                      ),
                      margin: EdgeInsets.only(
                        left: kDefaultMargin * 3,
                        top: kDefaultMargin * 2,
                        bottom: kDefaultMargin,
                      ),
                    ),
                    OrderList(data: controller.orders),
                  ],
                ),
              ),
      ),
      floatingActionButton: Obx(
        () => controller.orders.isNotEmpty
            ? FloatingActionButton(onPressed: () {}, child: Icon(Icons.add))
            : Container(),
      ),
    );
  }
}

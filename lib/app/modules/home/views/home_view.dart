import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zendo_mobile/app/components/buttons/add_order_btn.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: Get.mediaQuery.size.height / 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
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

            // Content
            Obx(
              () => controller.orders.isEmpty
                  ?
                  // Orders Empty
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
                    )
                  :
                  // Orders Not Empty
                  Container(),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => controller.orders.isNotEmpty
            ? FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              )
            : Container(),
      ),
    );
  }
}

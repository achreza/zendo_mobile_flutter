import 'dart:developer';

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
    controller.fetchOngoingOrders();

    return Scaffold(
      body: Obx(
        () => controller.isFetchingOrder.isTrue
            ? _LoadingState()
            : controller.orders.isEmpty
                ? _EmptyState()
                : _NotEmptyState(),
      ),
      floatingActionButton: Obx(
        () => controller.orders.isNotEmpty
            ? FloatingActionButton(
                onPressed: controller.navigateToCreateOrder,
                child: Icon(Icons.add),
              )
            : Container(),
      ),
    );
  }
}

class _NotEmptyState extends StatelessWidget {
  _NotEmptyState({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PageTitle(),
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
    );
  }
}

class _EmptyState extends StatelessWidget {
  _EmptyState({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PageTitle(),
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
                AddOrderButton(onTap: controller.navigateToCreateOrder),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadingState extends StatelessWidget {
  _LoadingState({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PageTitle(),
        Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}

class _PageTitle extends StatelessWidget {
  const _PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/models/order_model.dart';
import 'package:zendo_mobile/app/data/services/order_service.dart';
import 'package:zendo_mobile/app/modules/home/views/home_view.dart';
import 'package:zendo_mobile/app/modules/home/views/profile_view.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  final List<Widget> pages = [HomeView(), ProfileView()];
  final RxInt tabIndex = 0.obs;
  final RxList<Order> orders = RxList();
  late TabController tabController;

  final RxBool isFetchingOrder = false.obs;
  final OrderService orderService = Get.find();

  void fetchOngoingOrders() async {
    isFetchingOrder.value = true;
    try {
      final orders = await orderService.getOngoingOrders();
      this.orders.value = orders;
    } catch (e) {
      // log(e.toString());
    } finally {
      isFetchingOrder.value = false;
    }
  }

  void changeTab(int index) {
    tabIndex.value = index;
    tabController.animateTo(index);
  }

  void navigateToCreateOrder() {
    Get.toNamed('/create-order');
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: pages.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

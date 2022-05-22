import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/dto/request/logout_request.dart';
import 'package:zendo_mobile/app/data/models/order.dart';
import 'package:zendo_mobile/app/data/models/profile.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';
import 'package:zendo_mobile/app/data/services/db_service.dart';
import 'package:zendo_mobile/app/data/services/order_service.dart';
import 'package:zendo_mobile/app/modules/home/views/home_view.dart';
import 'package:zendo_mobile/app/modules/home/views/profile_view.dart';
import 'package:zendo_mobile/app/routes/app_pages.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Widget> pages = [HomeView(), ProfileView()];
  final RxInt tabIndex = 0.obs;
  final RxList<Order> orders = RxList();
  final Rx<Profile?> profile = Rx<Profile?>(null);
  late TabController tabController;

  final RxBool isFetchingOrder = false.obs;
  final OrderService orderService = Get.find();

  final RxBool isFetchingProfile = true.obs;
  final AuthService authService = Get.find();

  final DbService dbService = Get.find();

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

  void fetchProfile() async {
    isFetchingProfile.value = true;
    try {
      final profile = await authService.getProfile();
      this.profile.value = profile;
    } catch (e) {
      log(e.toString());
    } finally {
      // isFetchingProfile.value = false;
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

  void logout() async {
    try {
      final token = dbService.getAuthToken();
      final LogoutRequest logoutRequest = LogoutRequest(token: token!);
      await authService.logout(logoutRequest);
    } catch (e) {
    } finally {
      dbService.deleteAuthToken();
      dbService.deleteUserCredential();
      Get.offNamedUntil('/login', (route) => false);
    }
  }
}

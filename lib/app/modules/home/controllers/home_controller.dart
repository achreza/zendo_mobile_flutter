import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/modules/home/views/home_view.dart';
import 'package:zendo_mobile/app/modules/home/views/profile_view.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  final List<Widget> pages = [HomeView(), ProfileView()];
  final RxInt tabIndex = 0.obs;
  final RxList<String> orders = RxList();
  late TabController tabController;
  final RxBool fetched = false.obs;

  void changeTab(int index) {
    tabIndex.value = index;
    tabController.animateTo(index);
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

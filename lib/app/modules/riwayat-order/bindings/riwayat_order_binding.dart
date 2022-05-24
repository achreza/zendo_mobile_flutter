import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/providers/auth_provider.dart';
import 'package:zendo_mobile/app/data/providers/order_provider.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';
import 'package:zendo_mobile/app/data/services/order_service.dart';

import '../controllers/riwayat_order_controller.dart';

class RiwayatOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderProvider>(() => OrderProvider());
    Get.lazyPut<OrderService>(() => OrderService());
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<RiwayatOrderController>(() => RiwayatOrderController());
  }
}

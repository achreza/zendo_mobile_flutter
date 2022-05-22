import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/providers/order_provider.dart';
import 'package:zendo_mobile/app/data/services/order_service.dart';

import '../../../data/providers/auth_provider.dart';
import '../../../data/services/auth_service.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderProvider>(() => OrderProvider());
    Get.lazyPut<OrderService>(() => OrderService());
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthService>(() => AuthService());
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}

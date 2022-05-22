import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/providers/order_provider.dart';
import 'package:zendo_mobile/app/data/services/order_service.dart';

import '../controllers/create_order_controller.dart';

class CreateOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateOrderController>(() => CreateOrderController());
    Get.lazyPut<OrderProvider>(() => OrderProvider());
    Get.lazyPut<OrderService>(() => OrderService());
  }
}

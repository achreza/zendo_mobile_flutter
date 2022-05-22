import 'package:get/get.dart';

import '../../../data/providers/order_provider.dart';
import '../../../data/services/order_service.dart';
import '../controllers/detail_order_controller.dart';

class DetailOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailOrderController>(() => DetailOrderController());
    Get.lazyPut<OrderProvider>(() => OrderProvider());
    Get.lazyPut<OrderService>(() => OrderService());
  }
}

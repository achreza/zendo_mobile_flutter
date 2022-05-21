import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/models/order.dart';

class DetailOrderController extends GetxController {
  final Rx<Order> data = Rx<Order>(Get.arguments as Order);

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments is Order) {
      data.value = Get.arguments as Order;
    } else {
      Get.back();
    }
  }
}

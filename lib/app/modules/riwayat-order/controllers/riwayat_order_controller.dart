import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/models/order.dart';
import 'package:zendo_mobile/app/data/services/order_service.dart';

class RiwayatOrderController extends GetxController with StateMixin {
  final OrderService _orderService = Get.find();
  final RxList<Order> orders = RxList();

  void fetchRiwayatOrder() async {
    change(null, status: RxStatus.loading());
    orders.value = await _orderService.getHistoryOrders();
    change(null, status: RxStatus.success());
  }
}

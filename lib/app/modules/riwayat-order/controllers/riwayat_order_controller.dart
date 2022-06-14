import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/models/order.dart';
import 'package:zendo_mobile/app/data/models/profile.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';
import 'package:zendo_mobile/app/data/services/order_service.dart';

class RiwayatOrderController extends GetxController with StateMixin {
  final OrderService _orderService = Get.find();
  final AuthService _authService = Get.find();

  final RxList<Order> orders = RxList();
  final Rx<Profile?> profile = Rx<Profile?>(null);

  void fetchRiwayatOrder() async {
    change(null, status: RxStatus.loading());
    orders.value = await _orderService.getHistoryOrders();
    change(null, status: RxStatus.success());
  }

  void fetchProfile() async {
    profile.value = await _authService.getProfile();
  }
}

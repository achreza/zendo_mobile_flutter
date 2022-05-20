import 'dart:developer';

import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/dto/response/list_order_response.dart';
import 'package:zendo_mobile/app/data/models/order_model.dart';
import 'package:zendo_mobile/app/data/providers/order_provider.dart';

class OrderService extends GetxService {
  final OrderProvider orderProvider = Get.find();

  Future<OrderService> init() async => this;

  Future<List<Order>> getOngoingOrders() async {
    final response = await orderProvider.getOngoingOrders();
    final ListOrderResponse orderResponse = ListOrderResponse.fromJson(response.body);
    return orderResponse.data;
  }
}

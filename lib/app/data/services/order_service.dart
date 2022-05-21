import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:zendo_mobile/app/data/dto/request/create_order_request.dart';
import 'package:zendo_mobile/app/data/dto/request/update_order_request.dart';
import 'package:zendo_mobile/app/data/dto/response/list_order_response.dart';
import 'package:zendo_mobile/app/data/dto/response/order_response.dart';
import 'package:zendo_mobile/app/data/models/order.dart';
import 'package:zendo_mobile/app/data/providers/order_provider.dart';

class OrderService extends GetxService {
  final OrderProvider orderProvider = Get.find();

  Future<OrderService> init() async => this;

  Future<void> createOrder(CreateOrderRequest requestData) async {
    final response = await orderProvider.create(requestData);

    switch (response.statusCode) {
      case HttpStatus.badRequest:
        throw Exception('Gagal membuat order');
      case HttpStatus.unprocessableEntity:
        throw Exception('Gagal membuat order');
      case null:
        throw Exception('Gagal menghubungkan ke server');
      default:
    }
  }

  Future<void> updateOrder(int id, UpdateOrderRequest requestData) async {
    final response = await orderProvider.update(id, requestData);

    switch (response.statusCode) {
      case HttpStatus.badRequest:
        throw Exception('Gagal mengubah order');
      case HttpStatus.unprocessableEntity:
        throw Exception('Gagal mengubah order');
      case null:
        throw Exception('Gagal menghubungkan ke server');
      default:
    }
  }

  Future<void> cancelOrder(int id) async {
    final response = await orderProvider.cancel(id);

    switch (response.statusCode) {
      case HttpStatus.badRequest:
        throw Exception('Gagal membatalkan order');
      case HttpStatus.unprocessableEntity:
        throw Exception('Gagal membatalkan order');
      case null:
        throw Exception('Gagal menghubungkan ke server');
      default:
    }
  }

  Future<void> completeOrder(int id) async {
    final response = await orderProvider.complete(id);

    switch (response.statusCode) {
      case HttpStatus.badRequest:
        throw Exception('Gagal menyelesaikan order');
      case HttpStatus.unprocessableEntity:
        throw Exception('Gagal menyelesaikan order');
      case null:
        throw Exception('Gagal menghubungkan ke server');
      default:
    }
  }

  Future<List<Order>> getOngoingOrders() async {
    final response = await orderProvider.getOngoingOrders();
    final ListOrderResponse orderResponse = ListOrderResponse.fromJson(response.body);
    return orderResponse.data;
  }

  Future<Order> getDetailOrder(int id) async {
    final response = await orderProvider.detail(id);
    final OrderResponse orderResponse = OrderResponse.fromJson(response.body);
    return orderResponse.data;
  }


}

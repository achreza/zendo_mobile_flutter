import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';
import 'package:zendo_mobile/app/data/dto/request/create_order_request.dart';
import 'package:zendo_mobile/app/data/dto/request/update_order_request.dart';
import 'package:zendo_mobile/app/data/services/db_service.dart';

class OrderProvider extends GetConnect {
  final DbService dbService = Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = apiBaseUrl;

    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Authorization'] = 'Bearer ${dbService.getAuthToken()}';
      request.headers['Accept'] = 'application/json';
      return request;
    });

    httpClient.addAuthenticator<dynamic>((request) async {
      if (request.url.toString().contains('/refresh')) {
        dbService.deleteAuthToken();
        dbService.deleteUserCredential();
        Get.offAllNamed('/login');
        return request;
      }

      final response = await httpClient.post('/refresh');

      final String newToken = response.body['data']['token'];
      await dbService.saveAuthToken(newToken);

      request.headers['Authorization'] = 'Bearer $newToken';
      request.headers['Accept'] = 'application/json';

      return request;
    });
  }

  Future<Response> create(CreateOrderRequest data) => post('/order', data.toJson());

  Future<Response> update(int id, UpdateOrderRequest data) => put('/order/$id', data.toJson());

  Future<Response> detail(int id) => get('/order/$id');

  Future<Response> cancel(int id) => post('/order/$id/cancel', {});

  Future<Response> complete(int id) => post('/order/$id/complete', {});

  Future<Response> getOngoingOrders() => get('/profile/order/ongoing');

  Future<Response> getHistoryOrders() => get('/profile/order/history');
}

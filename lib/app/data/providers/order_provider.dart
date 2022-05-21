import 'package:get/get.dart';
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
      Get.offAllNamed('/login');
      return request;
    });
  }

  Future<Response> create(CreateOrderRequest data) => post('/order', data.toJson());

  Future<Response> update(int id, UpdateOrderRequest data) => put('/order/$id', data.toJson());

  Future<Response> detail(int id) => get('/order/$id');

  Future<Response> getOngoingOrders() => get('/profile/order/ongoing');

}

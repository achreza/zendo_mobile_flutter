import 'package:get/get.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';
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

  Future<Response> getOngoingOrders() => get('/profile/order/ongoing');
}

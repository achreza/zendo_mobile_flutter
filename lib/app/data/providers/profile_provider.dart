import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';
import 'package:zendo_mobile/app/data/services/db_service.dart';

class ProfileProvider extends GetConnect {
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

  Future<Response> profile() => get('/profile');
}

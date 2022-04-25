import 'package:get/get.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';
import 'package:zendo_mobile/app/data/dto/request/login_request.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiBaseUrl;
  }

  Future<Response> login(LoginRequest data) => post('/login', data.toJson());
}

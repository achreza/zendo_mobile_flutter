import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:zendo_mobile/app/data/dto/response/login_response.dart';
import 'package:zendo_mobile/app/data/models/user.dart';
import 'package:zendo_mobile/app/data/providers/auth_provider.dart';
import 'package:zendo_mobile/app/data/services/db_service.dart';

import '../dto/request/login_request.dart';

class AuthService extends GetxService {
  final DbService dbService = Get.find();
  final AuthProvider authProvider = Get.find();

  Future<AuthService> init() async => this;

  get isLoggedIn => dbService.getUser() != null && dbService.getAuthToken() != null;

  Future<void> login(String phoneNumber, String password) async {
    final request = LoginRequest(phone_number: phoneNumber, password: password);
    final response = await authProvider.login(request);

    switch (response.statusCode) {
      case HttpStatus.badRequest:
        throw Exception('Kredensial tidak valid');
      case null:
        throw Exception('Gagal menghubungkan ke server');
      default:
    }

    final LoginResponse loginResponse = LoginResponse.fromJson(response.body);
    final data = loginResponse.data;

    final user = User(name: data.phone_number, phoneNumber: data.phone_number);
    final token = data.token;

    await Future.wait([
      dbService.saveUser(user),
      dbService.saveAuthToken(token),
    ]);
  }
}
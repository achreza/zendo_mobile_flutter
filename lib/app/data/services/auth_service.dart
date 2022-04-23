import 'package:get/get.dart';
import 'package:zendo_mobile/app/data/models/user.dart';
import 'package:zendo_mobile/app/data/services/db_service.dart';

class AuthService extends GetxService {
  final DbService dbService = Get.find();

  Future<AuthService> init() async => this;

  get isLoggedIn =>
      dbService.getUser() != null && dbService.getAuthToken() != null && dbService.getRefreshToken() != null;

  Future<void> login(String phoneNumber, String password) async {
    User user = User(phoneNumber: phoneNumber, name: 'test');
    await Future.wait([
      dbService.saveUser(user),
      dbService.saveAuthToken('auth_token'),
      dbService.saveRefreshToken('refresh_token'),
    ]);

    Get.offAllNamed('/home');
  }
}

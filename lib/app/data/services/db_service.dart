import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:zendo_mobile/app/data/models/user_credential.dart';

class DbService extends GetxService {
  late Box<UserCredential> _userCredentialBox;
  late Box<String> _authTokenBox;
  late Box<String> _refreshTokenBox;

  Future<DbService> init() async {
    _userCredentialBox = await Hive.openBox<UserCredential>('user_credentials');
    _authTokenBox = await Hive.openBox<String>('auth_tokens');
    _refreshTokenBox = await Hive.openBox<String>('refresh_tokens');

    return this;
  }

  Future<void> saveUserCredential(UserCredential userCredential) async =>
      await _userCredentialBox.put(0, userCredential);

  UserCredential? getUserCredential() => _userCredentialBox.get(0);

  Future<void> saveAuthToken(String token) async => await _authTokenBox.put(0, token);

  String? getAuthToken() => _authTokenBox.get(0);

  Future<void> saveRefreshToken(String token) async => await _refreshTokenBox.put(0, token);

  String? getRefreshToken() => _refreshTokenBox.get(0);

  Future<void> clear() async {
    await _userCredentialBox.delete(0);
    await _authTokenBox.delete(0);
    await _refreshTokenBox.delete(0);
  }
}

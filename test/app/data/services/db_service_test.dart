import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:zendo_mobile/app/data/models/user_credential.dart';
import 'package:zendo_mobile/app/data/services/db_service.dart';
import 'db_service_test.mocks.dart';

@GenerateMocks([DbService])
void main() {
  final dbService = MockDbService();

  group('DbService', () {
    test('should be defined', () {
      expect(dbService, isNotNull);
    });

    test('should have methods', () {
      expect(dbService.init, isNotNull);
      expect(dbService.saveUserCredential, isNotNull);
      expect(dbService.getUserCredential, isNotNull);
      expect(dbService.saveAuthToken, isNotNull);
      expect(dbService.getAuthToken, isNotNull);
      expect(dbService.saveRefreshToken, isNotNull);
      expect(dbService.getRefreshToken, isNotNull);
      expect(dbService.clear, isNotNull);
    });

    test('method init should return DbService', () async {
      final expectedValue = DbService();

      when(dbService.init()).thenAnswer((_) async => expectedValue);

      final actualValue = await dbService.init();
      expect(actualValue, expectedValue);
    });

    test('method saveUserCredential should not throw exception', () async {
      final user = UserCredential(phoneNumber: '+123456789', token: 'token');
      await dbService.saveUserCredential(user);
    });

    test('method saveUserCredential should throw exception', () async {
      final user = UserCredential(phoneNumber: '+123456789', token: 'token');
      when(dbService.saveUserCredential(user)).thenThrow(Exception());

      expect(() => dbService.saveUser(user), throwsException);
    });

    test('method getUser should return UserCredential', () {
      const expectedValue = UserCredential(phoneNumber: '+123456789', token: 'token');
      when(dbService.getUserCredential()).thenAnswer((_) => expectedValue);

      final user = dbService.getUserCredential();
      expect(user, expectedValue);
    });

    test('method getUserCredential should return null', () {
      when(dbService.getUserCredential()).thenAnswer((_) => null);

      final user = dbService.getUserCredential();
      expect(user, null);
    });

    test('method saveAuthToken should not throw exception', () async {
      const token = 'auth_token';
      await dbService.saveAuthToken(token);
    });

    test('method saveAuthToken should throw exception', () async {
      const token = 'auth_token';
      when(dbService.saveAuthToken(token)).thenThrow(Exception());

      expect(() => dbService.saveAuthToken(token), throwsException);
    });

    test('method getAuthToken should return String', () {
      const token = 'auth_token';
      when(dbService.getAuthToken()).thenAnswer((_) => token);

      final actualValue = dbService.getAuthToken();
      expect(actualValue, token);
      expect(actualValue, isA<String>());
    });

    test('method getAuthToken should return null', () {
      when(dbService.getAuthToken()).thenAnswer((_) => null);

      final actualValue = dbService.getAuthToken();
      expect(actualValue, null);
    });

    test('method saveRefreshToken should not throw exception', () async {
      const token = 'refresh_token';
      await dbService.saveRefreshToken(token);
    });

    test('method saveRefreshToken should throw exception', () async {
      const token = 'refresh_token';
      when(dbService.saveRefreshToken(token)).thenThrow(Exception());

      expect(() => dbService.saveRefreshToken(token), throwsException);
    });

    test('method getRefreshToken should return String', () {
      const token = 'refresh_token';
      when(dbService.getRefreshToken()).thenAnswer((_) => token);

      final actualValue = dbService.getRefreshToken();
      expect(actualValue, token);
      expect(actualValue, isA<String>());
    });

    test('method getRefreshToken should return null', () {
      when(dbService.getRefreshToken()).thenAnswer((_) => null);

      final actualValue = dbService.getRefreshToken();
      expect(actualValue, null);
    });

    test('method clear should not throw exception', () async {
      await dbService.clear();
    });

    test('method clear should throw exception', () async {
      when(dbService.clear()).thenThrow(Exception());

      expect(() => dbService.clear(), throwsException);
    });
  });
}

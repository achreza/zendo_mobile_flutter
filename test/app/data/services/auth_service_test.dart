import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:zendo_mobile/app/data/services/auth_service.dart';

import 'auth_service_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  final authService = MockAuthService();

  group('AuthService', () {
    test('should be defined', () {
      expect(authService, isNotNull);
    });

    test('should have methods', () {
      expect(authService.init, isNotNull);
      expect(authService.login, isNotNull);
    });

    test('method init should return AuthService', () async {
      final expectedValue = MockAuthService();

      when(authService.init()).thenAnswer((_) async => expectedValue);

      final actualValue = await authService.init();
      expect(actualValue, expectedValue);
    });

    test('method login should not throw exception', () async {
      await authService.login('+123456789', 'test');
    });

    test('method login should throw exception', () async {
      when(authService.login('+123456789', 'test')).thenThrow(Exception());

      expect(() => authService.login('+123456789', 'test'), throwsException);
    });

    test('method isLoggedIn should return true', () {
      when(authService.isLoggedIn).thenAnswer((_) => true);

      final isLoggedIn = authService.isLoggedIn;
      expect(isLoggedIn, true);
    });

    test('method isLoggedIn should return false', () {
      when(authService.isLoggedIn).thenAnswer((_) => false);

      final isLoggedIn = authService.isLoggedIn;
      expect(isLoggedIn, false);
    });
  });
}

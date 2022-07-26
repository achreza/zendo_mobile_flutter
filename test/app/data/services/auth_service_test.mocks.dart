// Mocks generated by Mockito 5.1.0 from annotations
// in zendo_mobile/test/app/data/services/auth_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:get/get.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:zendo_mobile/app/data/providers/auth_provider.dart' as _i3;
import 'package:zendo_mobile/app/data/services/auth_service.dart' as _i5;
import 'package:zendo_mobile/app/data/services/db_service.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeDbService_0 extends _i1.Fake implements _i2.DbService {}

class _FakeAuthProvider_1 extends _i1.Fake implements _i3.AuthProvider {}

class _FakeInternalFinalCallback_2<T> extends _i1.Fake
    implements _i4.InternalFinalCallback<T> {}

class _FakeAuthService_3 extends _i1.Fake implements _i5.AuthService {}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i5.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DbService get dbService =>
      (super.noSuchMethod(Invocation.getter(#dbService),
          returnValue: _FakeDbService_0()) as _i2.DbService);
  @override
  _i3.AuthProvider get authProvider =>
      (super.noSuchMethod(Invocation.getter(#authProvider),
          returnValue: _FakeAuthProvider_1()) as _i3.AuthProvider);
  @override
  _i4.InternalFinalCallback<void> get onStart =>
      (super.noSuchMethod(Invocation.getter(#onStart),
              returnValue: _FakeInternalFinalCallback_2<void>())
          as _i4.InternalFinalCallback<void>);
  @override
  _i4.InternalFinalCallback<void> get onDelete =>
      (super.noSuchMethod(Invocation.getter(#onDelete),
              returnValue: _FakeInternalFinalCallback_2<void>())
          as _i4.InternalFinalCallback<void>);
  @override
  bool get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized), returnValue: false)
          as bool);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  _i6.Future<_i5.AuthService> init() =>
      (super.noSuchMethod(Invocation.method(#init, []),
              returnValue: Future<_i5.AuthService>.value(_FakeAuthService_3()))
          as _i6.Future<_i5.AuthService>);
  @override
  _i6.Future<void> login(String? phoneNumber, String? password) =>
      (super.noSuchMethod(Invocation.method(#login, [phoneNumber, password]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void onInit() => super.noSuchMethod(Invocation.method(#onInit, []),
      returnValueForMissingStub: null);
  @override
  void onReady() => super.noSuchMethod(Invocation.method(#onReady, []),
      returnValueForMissingStub: null);
  @override
  void onClose() => super.noSuchMethod(Invocation.method(#onClose, []),
      returnValueForMissingStub: null);
  @override
  void $configureLifeCycle() =>
      super.noSuchMethod(Invocation.method(#$configureLifeCycle, []),
          returnValueForMissingStub: null);
}

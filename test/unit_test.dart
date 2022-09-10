import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:starter_flutter/models/default_entity.dart';
import 'package:starter_flutter/services/authentication/firebase_authenticator.dart';

/// Mocking dependencies with Moquito
class MockFirebaseAuthenticator extends Mock implements FirebaseAuthenticator { }

void main() {
  group('A Group of unit tests', () {

    test('1. GIVEN <state> WHEN <action> EXPECT <result>', () async {
      //ARRANGE
      final entity = const DefaultEntity(fieldName1: "test_name");

      //ACT
      final json = entity.toJson();

      //ASSERT
      expect(entity.id, null);
    });

    test('2. GIVEN <state> WHEN <action> EXPECT <result>', () async {
      //ARRANGE
      final mockAuthenticator = MockFirebaseAuthenticator();
      when(mockAuthenticator.init()).thenAnswer((realInvocation) {
        print("answered");
      });

      //ACT
      mockAuthenticator.init();

      //ASSERT
      verify(mockAuthenticator.init()).called(1);

    });

  });
}

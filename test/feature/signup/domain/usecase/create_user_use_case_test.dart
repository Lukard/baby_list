import 'package:baby_list/feature/signup/data/datasource/create_user_data_source.dart';
import 'package:baby_list/feature/signup/domain/usecase/create_user_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_user_use_case_test.mocks.dart';

@GenerateMocks([CreateUserDataSource, User])
void main() {
  final CreateUserDataSource _dataSource = MockCreateUserDataSource();
  final CreateUserUseCase _useCase = CreateUserUseCase(_dataSource);

  test('should create user and update display name', () async {
    String username = 'User Name';
    String email = 'test@test.test';
    String password = 'password123';
    User user = MockUser();
    when(_dataSource.createUser(email, password))
        .thenAnswer((_) => Future.value(user));

    await _useCase(username, email, password);

    verify(_dataSource.createUser(email, password));
    verify(user.updateProfile(displayName: username));
  });
}

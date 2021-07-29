import 'package:baby_list/feature/signup/data/datasource/create_user_data_source.dart';
import 'package:baby_list/feature/signup/data/error/create_user_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_user_data_source_test.mocks.dart';

@GenerateMocks([FirebaseAuth, User, UserCredential])
void main() {
  final String email = 'test@test.test';
  final String password = 'securePassword123';
  final User user = MockUser();
  final UserCredential userCredential = MockUserCredential();

  final FirebaseAuth _auth = MockFirebaseAuth();
  final CreateUserDataSource _dataSource = CreateUserDataSource(_auth);

  test('when valid email and password should create user', () {
    when(_auth.createUserWithEmailAndPassword(email: email, password: password))
        .thenAnswer((_) => Future.value(userCredential));
    when(userCredential.user).thenReturn(user);

    Future<User> result = _dataSource.createUser(email, password);

    expect(result, completion(equals(user)));
  });

  test(
      'when firebase auth fails at creating user should throw unknown exception',
      () {
    when(_auth.createUserWithEmailAndPassword(email: email, password: password))
        .thenAnswer((_) => Future.value(userCredential));
    when(userCredential.user).thenReturn(null);

    Future<User> result = _dataSource.createUser(email, password);

    expect(result, throwsA(isInstanceOf<UnknownCreateUserException>()));
  });

  test(
      'when firebase weak password exception should throw weak password exception',
      () {
    String message = 'Passwor is too weak';
    FirebaseAuthException weakPasswordException =
        FirebaseAuthException(code: 'weak-password', message: message);
    when(_auth.createUserWithEmailAndPassword(email: email, password: password))
        .thenAnswer((_) => Future.error(weakPasswordException));

    Future<User> result = _dataSource.createUser(email, password);

    WeakPasswordException expected = WeakPasswordException(message);
    expect(result, throwsA(expected));
  });

  test(
      'when firebase email already in use exception should throw email already in use exception',
      () {
    FirebaseAuthException emailAlreadyInUseException =
        FirebaseAuthException(code: 'email-already-in-use');
    when(_auth.createUserWithEmailAndPassword(email: email, password: password))
        .thenAnswer((_) => Future.error(emailAlreadyInUseException));

    Future<User> result = _dataSource.createUser(email, password);

    EmailAlreadyInUseException expected = EmailAlreadyInUseException();
    expect(result, throwsA(expected));
  });

  test(
      'when firebase invalid email exception should throw invalid email exception',
      () {
    FirebaseAuthException invalidEmailException =
        FirebaseAuthException(code: 'invalid-email');
    when(_auth.createUserWithEmailAndPassword(email: email, password: password))
        .thenAnswer((_) => Future.error(invalidEmailException));

    Future<User> result = _dataSource.createUser(email, password);

    InvalidEmailException expected = InvalidEmailException();
    expect(result, throwsA(expected));
  });

  test('when firebase unknown exception should throw unknown exception', () {
    FirebaseAuthException unknownException =
        FirebaseAuthException(code: 'unknown');
    when(_auth.createUserWithEmailAndPassword(email: email, password: password))
        .thenAnswer((_) => Future.error(unknownException));

    Future<User> result = _dataSource.createUser(email, password);

    UnknownCreateUserException expected = UnknownCreateUserException();
    expect(result, throwsA(expected));
  });

  test('when any other unknown exception should throw unknown exception', () {
    Exception unknownException = Exception();
    when(_auth.createUserWithEmailAndPassword(email: email, password: password))
        .thenAnswer((_) => Future.error(unknownException));

    Future<User> result = _dataSource.createUser(email, password);

    UnknownCreateUserException expected = UnknownCreateUserException();
    expect(result, throwsA(expected));
  });
}

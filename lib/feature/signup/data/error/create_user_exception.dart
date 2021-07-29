import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'create_user_exception.freezed.dart';

@freezed
class CreateUserException with _$CreateUserException, Exception {
  const factory CreateUserException.unknown() = UnknownCreateUserException;
  const factory CreateUserException.weakPassword(String? message) =
      WeakPasswordException;
  const factory CreateUserException.emailAlreadyInUse() =
      EmailAlreadyInUseException;
  const factory CreateUserException.invalidEmail() = InvalidEmailException;
}

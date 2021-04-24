import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_field_exception.freezed.dart';

@freezed
class FirebaseFieldException
    with _$FirebaseFieldException
    implements Exception {
  factory FirebaseFieldException({required String message}) =
      _FirebaseFieldException;
}

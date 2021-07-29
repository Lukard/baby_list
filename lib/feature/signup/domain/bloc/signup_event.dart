part of 'signup_bloc.dart';

@freezed
class SignupEvent with _$SignupEvent {
  const factory SignupEvent.submit(
    String username,
    String email,
    String password,
  ) = _Submit;
}

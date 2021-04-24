part of '../welcome_bloc.dart';

@freezed
class WelcomeEvent with _$WelcomeEvent {
  const factory WelcomeEvent.nameTyped(String name) = _NameTyped;
  const factory WelcomeEvent.submit() = _Submit;
}

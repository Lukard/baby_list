part of '../welcome_bloc.dart';

@freezed
class WelcomeState with _$WelcomeState {
  const factory WelcomeState.nonAbleToSubmit() = _NonAbleToSubmit;
  const factory WelcomeState.ableToSubmit() = _AbleToSubmit;
  const factory WelcomeState.userLoggedIn(String userId) = _UserLoggedIn;
}

import 'dart:async';

import 'package:baby_list/feature/signup/data/error/create_user_exception.dart';
import 'package:baby_list/feature/signup/domain/usecase/create_user_use_case.dart';
import 'package:baby_list/feature/signup/navigation/loby_navigator.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_event.dart';
part 'signup_state.dart';
part 'signup_bloc.freezed.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  CreateUserUseCase _createUserUseCase;
  LobyNavigator _lobyNavigator;

  SignupBloc(this._createUserUseCase, this._lobyNavigator) : super(_Initial());

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    yield* event.when(submit: _mapSubmitEventToState);
  }

  Stream<SignupState> _mapSubmitEventToState(
    String username,
    String email,
    String password,
  ) async* {
    yield Sending();
    try {
      await _createUserUseCase(username, email, password);
      _lobyNavigator();
    } on WeakPasswordException catch (exception) {
      yield Error(exception.message);
    } on EmailAlreadyInUseException catch (_) {
      yield Error(
        'El correo electrónico ya esta registrado, utilice uno diferente',
      );
    } on InvalidEmailException catch (_) {
      yield Error('El correo electrónico tiene un formato incorrecto');
    } on UnknownCreateUserException catch (_) {
      yield Error('Registro insatisfactorio, por favor inténtelo mas tarde');
    }
  }
}

import 'dart:async';

import 'package:baby_list/feature/welcome/data/datasource/auth_data_source.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event/welcome_event.dart';
part 'state/welcome_state.dart';
part 'welcome_bloc.freezed.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final AuthDataSource _authDataSource;
  String name = "";

  WelcomeBloc(this._authDataSource) : super(_NonAbleToSubmit());

  @override
  Stream<WelcomeState> mapEventToState(
    WelcomeEvent event,
  ) async* {
    yield* event.when(
      nameTyped: (name) async* {
        this.name = name;
        yield name.isEmpty ? _NonAbleToSubmit() : _AbleToSubmit();
      },
      submit: () => _authDataSource
          .anonymousLogin(name)
          .asyncMap((_) => _UserLoggedIn(name)),
    );
  }
}

import 'dart:async';

import 'package:baby_list/core/data/datasource/auth_data_source.dart';
import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event/welcome_event.dart';
part 'state/welcome_state.dart';
part 'welcome_bloc.freezed.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final AuthDataSource _authDataSource;
  final GlobalKey<NavigatorState> _navigatorKey;

  String name = "";

  WelcomeBloc(this._authDataSource, this._navigatorKey)
      : super(_NonAbleToSubmit());

  @override
  Stream<WelcomeState> mapEventToState(
    WelcomeEvent event,
  ) async* {
    yield* event.when(
        nameTyped: (name) async* {
          this.name = name;
          yield name.isEmpty ? _NonAbleToSubmit() : _AbleToSubmit();
        },
        submit: () => _authDataSource.anonymousLogin(name).asyncMap((_) {
              _navigatorKey.currentState?.pushNamedAndRemoveUntil(
                NavigationPath.Loby,
                (route) => false,
              );
              return _UserLoggedIn(name);
            }),
        signup: () async* {
          _navigatorKey.currentState?.pushNamedAndRemoveUntil(
            NavigationPath.SignUp,
            (route) => false,
          );
        });
  }
}

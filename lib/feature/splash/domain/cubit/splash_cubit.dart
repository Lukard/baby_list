import 'package:baby_list/core/data/datasource/auth_data_source.dart';
import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthDataSource _authDataSource;
  final GlobalKey<NavigatorState> _navigatorKey;

  SplashCubit(this._authDataSource, this._navigatorKey)
      : super(SplashState.loading());

  void checkUserLoggedIn() {
    _authDataSource.isUserLoggedIn().then((isUserLoggedIn) {
      String path =
          isUserLoggedIn ? NavigationPath.Loby : NavigationPath.Welcome;
      _navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(path, (route) => false);
    });
  }
}

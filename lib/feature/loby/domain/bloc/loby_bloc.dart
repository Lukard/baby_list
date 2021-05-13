import 'dart:async';

import 'package:baby_list/core/data/datasource/auth_data_source.dart';
import 'package:baby_list/core/data/datasource/list_data_source.dart';
import 'package:baby_list/core/error/error_notifier.dart';
import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loby_event.dart';
part 'loby_state.dart';
part 'loby_bloc.freezed.dart';

class LobyBloc extends Bloc<LobyEvent, LobyState> {
  final AuthDataSource _authDataSource;
  final ListDataSource _listDataSource;
  final GlobalKey<NavigatorState> _navigatorKey;
  final ErrorNotifier _errorNotifier;

  String listCode = '';

  LobyBloc(
    this._authDataSource,
    this._listDataSource,
    this._navigatorKey,
    this._errorNotifier,
  ) : super(_NonAbleToSubmit());

  @override
  Stream<LobyState> mapEventToState(
    LobyEvent event,
  ) async* {
    yield* event.when(
      init: _mapInitEventToState,
      listCodeTyped: _mapListCodeTypedEventToState,
      submit: _mapSubmitEventToState,
    );
  }

  Stream<LobyState> _mapInitEventToState() async* {
    _authDataSource.isUserLoggedIn().then((isUserLoggedIn) {
      if (!isUserLoggedIn) {
        _navigatorKey.currentState?.pushNamedAndRemoveUntil(
          NavigationPath.Welcome,
          (route) => false,
        );
      }
    });
  }

  Stream<LobyState> _mapListCodeTypedEventToState(String code) async* {
    listCode = code;
    yield code.isEmpty ? _NonAbleToSubmit() : _AbleToSubmit();
  }

  Stream<LobyState> _mapSubmitEventToState() async* {
    yield _LoadingList();
    bool listExist = false;
    try {
      listExist = await _listDataSource.doesListExist(listCode);
    } catch (error) {
      listExist = false;
    }
    if (listExist) {
      _navigatorKey.currentState?.pushNamed(
        "${NavigationPath.List}/$listCode",
      );
    } else {
      _errorNotifier.showError('¡No hay ninguna lista con ese código!');
    }
    yield _AbleToSubmit();
  }
}

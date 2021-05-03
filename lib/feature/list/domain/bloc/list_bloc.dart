import 'dart:async';

import 'package:baby_list/core/data/datasource/auth_data_source.dart';
import 'package:baby_list/core/data/datasource/list_data_source.dart';
import 'package:baby_list/core/navigation/detail_arguments.dart';
import 'package:baby_list/core/navigation/list_arguments.dart';
import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_event.dart';
part 'list_state.dart';
part 'list_bloc.freezed.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final AuthDataSource _authDataSource;
  final ListDataSource _listDataSource;
  final GlobalKey<NavigatorState> _navigatorKey;

  ListBloc(this._authDataSource, this._listDataSource, this._navigatorKey)
      : super(ListState.loading());

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    yield* event.when(
      Init: (arguments) async* {
        yield* _mapGetListToState(arguments);
      },
      ItemTap: (String listId, Item item) async* {
        _navigatorKey.currentState?.pushNamed(
          NavigationPath.Detail,
          arguments: DetailArguments(listId, item),
        );
      },
    );
  }

  Stream<ListState> _mapGetListToState(ListArguments? arguments) async* {
    if (!_authDataSource.isUserLoggedIn()) {
      _navigatorKey.currentState?.pushNamedAndRemoveUntil(
        NavigationPath.Welcome,
        (route) => false,
      );
    } else if (arguments == null) {
      _navigatorKey.currentState?.pushNamedAndRemoveUntil(
        NavigationPath.Loby,
        (route) => false,
      );
    } else {
      yield* _listDataSource
          .getList(arguments.id)
          .asyncMap((event) => ListState.data(arguments.id, event));
    }
  }
}

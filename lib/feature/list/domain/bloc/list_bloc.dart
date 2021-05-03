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

  StreamSubscription<BabyList>? _streamSubscription;

  ListBloc(this._authDataSource, this._listDataSource, this._navigatorKey)
      : super(ListState.loading());

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    yield* event.when(
      Init: _mapGetListToState,
      DataReceived: _mapDataReceivedEventToState,
      ItemTap: _mapItemTapEventToState,
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
      _streamSubscription?.cancel();
      _streamSubscription = _listDataSource
          .getList(arguments.id)
          .listen((list) => add(ListEvent.DataReceived(arguments.id, list)));
    }
  }

  Stream<ListState> _mapDataReceivedEventToState(
    String listId,
    BabyList list,
  ) async* {
    yield ListState.data(listId, list);
  }

  Stream<ListState> _mapItemTapEventToState(String listId, Item item) async* {
    _navigatorKey.currentState?.pushNamed(
      NavigationPath.Detail,
      arguments: DetailArguments(listId, item),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

import 'dart:async';

import 'package:baby_list/core/data/datasource/auth_data_source.dart';
import 'package:baby_list/core/data/datasource/list_data_source.dart';
import 'package:baby_list/core/error/error_notifier.dart';
import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'detail_event.dart';
part 'detail_state.dart';
part 'detail_bloc.freezed.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final AuthDataSource _authDataSource;
  final ListDataSource _listDataSource;
  final GlobalKey<NavigatorState> _navigatorKey;
  final ErrorNotifier _errorNotifier;

  StreamSubscription<Item>? _streamSubscription;

  DetailBloc(
    this._authDataSource,
    this._listDataSource,
    this._navigatorKey,
    this._errorNotifier,
  ) : super(DetailState.initial());

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) {
    return event.when(
      started: _mapStartedEventToState,
      loaded: _mapLoadedEventToState,
      moreInformation: _mapMoreInformationEventToState,
      booked: _mapBookedEventToState,
    );
  }

  Stream<DetailState> _mapStartedEventToState(
    String listId,
    String itemId,
  ) async* {
    if (!_authDataSource.isUserLoggedIn()) {
      _navigatorKey.currentState?.pushNamedAndRemoveUntil(
        NavigationPath.Welcome,
        (route) => false,
      );
    } else {
      _streamSubscription?.cancel();
      _streamSubscription = _listDataSource
          .getList(listId)
          .expand((list) => list.categories)
          .expand((category) => category.items)
          .where((item) => item.id == itemId)
          .listen(
            (item) => add(DetailEvent.loaded(listId: listId, item: item)),
          );
    }
  }

  Stream<DetailState> _mapLoadedEventToState(String listId, Item item) async* {
    yield DetailState.data(listId: listId, item: item);
  }

  Stream<DetailState> _mapMoreInformationEventToState(String link) async* {
    bool canBeLaunched = await canLaunch(link);
    if (canBeLaunched) {
      launch(link);
    } else {
      _errorNotifier.showError('Por desgracia este link no funciona.');
    }
  }

  Stream<DetailState> _mapBookedEventToState(String listId, Item item) async* {
    yield DetailState.booking(item);
    Booking booking = _authDataSource.getBooking();
    await _listDataSource.bookItem(listId, item, booking);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

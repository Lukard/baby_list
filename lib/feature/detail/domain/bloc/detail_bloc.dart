import 'dart:async';

import 'package:baby_list/core/data/datasource/auth_data_source.dart';
import 'package:baby_list/core/data/datasource/list_data_source.dart';
import 'package:baby_list/core/error/error_notifier.dart';
import 'package:baby_list/core/navigation/detail_arguments.dart';
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

  DetailArguments? _arguments;
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
    DetailArguments? arguments,
  ) async* {
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
      _arguments = arguments;
      _streamSubscription?.cancel();
      _streamSubscription = _listDataSource
          .getList(arguments.listId)
          .expand((list) => list.categories)
          .expand((category) => category.items)
          .where((item) => item.title == arguments.item.title)
          .listen((item) => add(DetailEvent.loaded(item)));
    }
  }

  Stream<DetailState> _mapLoadedEventToState(Item item) async* {
    yield DetailState.data(item);
  }

  Stream<DetailState> _mapMoreInformationEventToState(String link) async* {
    bool canBeLaunched = await canLaunch(link);
    if (canBeLaunched) {
      launch(link);
    } else {
      _errorNotifier.showError('Por desgracia este link no funciona.');
    }
  }

  Stream<DetailState> _mapBookedEventToState(Item item) async* {
    yield DetailState.booking(item);
    Booking booking = _authDataSource.getBooking();
    await _listDataSource.bookItem(_arguments!.listId, item, booking);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

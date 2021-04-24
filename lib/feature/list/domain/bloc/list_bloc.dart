import 'dart:async';

import 'package:baby_list/feature/list/data/datasource/list_data_source.dart';
import 'package:baby_list/feature/list/domain/bloc/event/list_event.dart';
import 'package:baby_list/feature/list/domain/bloc/state/list_state.dart';
import 'package:bloc/bloc.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ListDataSource _dataSource;

  ListBloc(this._dataSource) : super(LoadingState());

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    if (event is Init) {
      yield* _mapGetListToState();
    }
  }

  Stream<ListState> _mapGetListToState() {
    return _dataSource.getList('ywP3CJGcIUXaMSGDynwe').asyncMap(
          (event) => DataState(event),
        );
  }
}

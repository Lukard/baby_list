part of 'list_bloc.dart';

@freezed
class ListState with _$ListState {
  const factory ListState.data(String listId, BabyList list) = _DataState;
  const factory ListState.loading() = _LoadingState;
  const factory ListState.error(Exception exception) = _ErrorState;
}

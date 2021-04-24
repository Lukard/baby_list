import 'package:baby_list/feature/list/domain/model/baby_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_state.freezed.dart';

@freezed
class ListState with _$ListState {
  const factory ListState.data(BabyList list) = DataState;
  const factory ListState.loading() = LoadingState;
  const factory ListState.error(Exception exception) = ErrorState;
}

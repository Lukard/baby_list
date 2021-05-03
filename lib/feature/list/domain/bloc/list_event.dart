part of 'list_bloc.dart';

@freezed
class ListEvent with _$ListEvent {
  const factory ListEvent.Init(ListArguments? arguments) = _Init;
  const factory ListEvent.ItemTap(String listId, Item item) = _ItemTap;
}

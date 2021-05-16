part of 'detail_bloc.dart';

@freezed
class DetailEvent with _$DetailEvent {
  const factory DetailEvent.started({
    required String listId,
    required String itemId,
  }) = _Started;
  const factory DetailEvent.loaded({
    required String listId,
    required Item item,
  }) = _Loaded;
  const factory DetailEvent.moreInformation(String link) = _MoreInformation;
  const factory DetailEvent.booked({
    required String listId,
    required Item item,
  }) = _Booked;
  const factory DetailEvent.discarded({
    required String listId,
    required Item item,
  }) = _Discarded;
}

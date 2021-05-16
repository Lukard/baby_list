part of 'detail_bloc.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState.initial() = _Initial;
  const factory DetailState.booking(Item item) = _Booking;
  const factory DetailState.data({
    required String listId,
    required Item item,
    required bool didAtLeastOneBooking,
  }) = _Data;
}

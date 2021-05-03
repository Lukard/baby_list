part of 'detail_bloc.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState.initial() = _Initial;
  const factory DetailState.booking(Item item) = _Booking;
  const factory DetailState.data(Item item) = _Data;
}

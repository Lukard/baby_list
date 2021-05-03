part of 'detail_bloc.dart';

@freezed
class DetailEvent with _$DetailEvent {
  const factory DetailEvent.started(DetailArguments? arguments) = _Started;
  const factory DetailEvent.loaded(Item item) = _Loaded;
  const factory DetailEvent.booked(Item item) = _Booked;
}

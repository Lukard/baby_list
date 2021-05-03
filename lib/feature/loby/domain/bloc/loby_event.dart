part of 'loby_bloc.dart';

@freezed
class LobyEvent with _$LobyEvent {
  const factory LobyEvent.init() = _Init;
  const factory LobyEvent.listCodeTyped(String code) = _ListCodeTyped;
  const factory LobyEvent.submit() = _Submit;
}

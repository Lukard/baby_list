part of 'loby_bloc.dart';

@freezed
class LobyState with _$LobyState {
  const factory LobyState.nonAbleToSubmit() = _NonAbleToSubmit;
  const factory LobyState.ableToSubmit() = _AbleToSubmit;
  const factory LobyState.loadingList() = _LoadingList;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_arguments.freezed.dart';

@freezed
class ListArguments with _$ListArguments {
  const factory ListArguments(String id) = _ListArguments;
}

import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_arguments.freezed.dart';

@freezed
class DetailArguments with _$DetailArguments {
  const factory DetailArguments(String listId, Item item) = _DetailArguments;
}

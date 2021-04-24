import 'package:baby_list/feature/list/domain/model/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'baby_list.freezed.dart';
part 'baby_list.g.dart';

@freezed
class BabyList with _$BabyList {
  factory BabyList({
    required String title,
    required List<Category> categories,
  }) = _BabyList;

  factory BabyList.fromJson(Map<String, dynamic> json) =>
      _$BabyListFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.dart';
part 'item.dart';
part 'category.dart';
part 'baby_list.freezed.dart';
part 'baby_list.g.dart';

@freezed
class BabyList with _$BabyList {
  factory BabyList(
    String title,
    List<Category> categories,
  ) = _BabyList;

  factory BabyList.fromJson(Map<String, dynamic> json) =>
      _$BabyListFromJson(json);
}

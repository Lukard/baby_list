part of 'baby_list.dart';

@freezed
class Category with _$Category {
  factory Category({
    required String title,
    required List<Item> items,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

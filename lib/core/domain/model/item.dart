part of 'baby_list.dart';

@freezed
class Item with _$Item {
  const Item._();
  const factory Item(
    String id,
    String title,
    String image,
    String? description,
    double price,
    int total,
    List<Booking>? bookings,
    String link,
  ) = _Item;

  int get available => total - (bookings?.length ?? 0);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

part of 'baby_list.dart';

@freezed
class Booking with _$Booking {
  const factory Booking(String uid, String name) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}

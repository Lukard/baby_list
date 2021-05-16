import 'package:baby_list/feature/detail/presentation/atom/already_booked_text.dart';
import 'package:baby_list/feature/detail/presentation/atom/book_stadium_button.dart';
import 'package:baby_list/feature/detail/presentation/atom/discard_stadium_button.dart';
import 'package:baby_list/feature/detail/presentation/atom/remaining_bookings_text.dart';
import 'package:flutter/material.dart';

class BookingArea extends StatelessWidget {
  final bool isBooking;
  final bool didAtLeastOneBooking;
  final int remainingBookings;
  final VoidCallback? onBook;
  final VoidCallback? onDiscard;

  const BookingArea({
    Key? key,
    required this.isBooking,
    required this.didAtLeastOneBooking,
    required this.remainingBookings,
    this.onBook,
    this.onDiscard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isBooking)
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );

    if (remainingBookings > 0 && didAtLeastOneBooking) {
      return Column(
        children: [
          RemainingBookingsText(availableBookings: remainingBookings),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: BookStadiumButton(onBook: onBook),
                  ),
                ),
                DiscardStadiumButton(onDiscard: onDiscard),
              ],
            ),
          ),
        ],
      );
    } else if (remainingBookings > 0 && !didAtLeastOneBooking) {
      return Column(
        children: [
          RemainingBookingsText(availableBookings: remainingBookings),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: BookStadiumButton(onBook: onBook),
          ),
        ],
      );
    } else if (remainingBookings <= 0 && didAtLeastOneBooking) {
      return Column(
        children: [
          AlreadyBookedText(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: DiscardStadiumButton(onDiscard: onDiscard),
          ),
        ],
      );
    } else {
      return AlreadyBookedText();
    }
  }
}

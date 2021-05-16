import 'package:flutter/material.dart';

class RemainingBookingsText extends StatelessWidget {
  final int availableBookings;

  const RemainingBookingsText({Key? key, required this.availableBookings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '¡Rápido! Solo quedan ${availableBookings} disponibles.',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}

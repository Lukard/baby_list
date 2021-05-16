import 'package:baby_list/xds/atom/stadium_button.dart';
import 'package:flutter/material.dart';

class BookStadiumButton extends StatelessWidget {
  final VoidCallback? onBook;

  const BookStadiumButton({Key? key, this.onBook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StadiumButton(
      text: 'Reservar',
      onPressed: onBook,
      isRelevant: true,
      shouldFillAllWidth: true,
    );
  }
}

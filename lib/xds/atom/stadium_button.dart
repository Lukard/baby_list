import 'package:flutter/material.dart';

class StadiumButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const StadiumButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(text),
        ),
      ),
    );
  }
}

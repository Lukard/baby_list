import 'package:flutter/material.dart';

class StadiumTextField extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;

  const StadiumTextField({Key? key, this.hintText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(32.0)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
        hintText: hintText,
      ),
      onChanged: onChanged,
    );
  }
}

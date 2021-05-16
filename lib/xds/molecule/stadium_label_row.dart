import 'package:baby_list/xds/atom/stadium_label.dart';
import 'package:flutter/material.dart';

class StadiumLabelRow extends StatelessWidget {
  final List<String> texts;

  const StadiumLabelRow({Key? key, required this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: List.generate(
        texts.length,
        (index) => StadiumLabel(text: texts[index]),
      ),
    );
  }
}

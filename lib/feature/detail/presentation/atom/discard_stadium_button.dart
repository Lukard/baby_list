import 'package:baby_list/xds/atom/stadium_button.dart';
import 'package:flutter/material.dart';

class DiscardStadiumButton extends StatelessWidget {
  final VoidCallback? onDiscard;

  const DiscardStadiumButton({Key? key, this.onDiscard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StadiumButton(
      text: 'Descartar',
      onPressed: onDiscard,
    );
  }
}

import 'package:flutter/material.dart';

class AlreadyBookedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Gente maravillosa ya ha reservado este regalo. Vuelve a la lista, seguro que encuentras algún artículo de tu agrado.',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}

import 'package:baby_list/xds/molecule/stadium_label_row.dart';
import 'package:flutter/material.dart';

class Participation extends StatelessWidget {
  final List<String> participants;

  const Participation({Key? key, required this.participants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (participants.isEmpty) {
      return Text('Aún nadie ha reservado este regalo. ¡Sé el primero!');
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ellos ya han reservado este magnifico regalo:'),
          SizedBox(height: 8.0),
          StadiumLabelRow(texts: participants),
        ],
      );
    }
  }
}

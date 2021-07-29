import 'dart:convert';
import 'dart:io';

import 'package:gsheets/gsheets.dart';

void main(List<String> args) async {
  final gSheets = GSheets(_credentials);
  final spreadsheet = await gSheets.spreadsheet(spreadsheetId);
  final sheet = spreadsheet.worksheetByTitle('Translations');

  if (sheet == null) throw ('Could not access Translation sheet.');

  final data = await sheet.values.allRows();

  for (var localePos = 1; localePos < data[1].length; localePos++) {
    final filename = "${data[1][localePos]}.json";
    final content = {};

    for (var keyPos = 2; keyPos < data.length; keyPos++) {
      final key = data[keyPos][0];
      final value = data[keyPos][localePos];

      content[key] = value;
    }

    final file = File("asset/translations/${filename}");
    await file.writeAsString(json.encode(content));
  }
}

import 'package:flutter_test/flutter_test.dart';

extension EnterKeyboardText on WidgetTester {
  Future<void> enterKeyboardText(Finder finder, String text) async {
    //await showKeyboard(finder);
    //await pumpAndSettle(Duration(seconds: 1));
    await enterText(finder, text);
  }
}

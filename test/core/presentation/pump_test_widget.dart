import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_widget.dart';

extension PumpTestWidget on WidgetTester {
  Future<void> pumpTestWidget(
    Widget child, {
    bool shouldPumpAndSettle = true,
  }) async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    await pumpWidget(Test(child: child));
    if (shouldPumpAndSettle) await pumpAndSettle();
  }
}

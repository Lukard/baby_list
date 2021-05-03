import 'package:baby_list/xds/organism/error_snackbar.dart';
import 'package:flutter/material.dart';

class ErrorNotifier {
  GlobalKey<ScaffoldMessengerState> _scaffoldMessengerStateKey = GlobalKey();

  GlobalKey<ScaffoldMessengerState> generateNewKey() {
    _scaffoldMessengerStateKey = GlobalKey();
    return _scaffoldMessengerStateKey;
  }

  void showError(String message) {
    _scaffoldMessengerStateKey.currentState?.showSnackBar(
      ErrorSnackbar(message: message),
    );
  }
}

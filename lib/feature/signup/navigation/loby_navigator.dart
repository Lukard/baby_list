import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:flutter/material.dart';

class LobyNavigator {
  final GlobalKey<NavigatorState> _navigatorKey;

  LobyNavigator(this._navigatorKey);

  void call() {
    _navigatorKey.currentState?.pushNamedAndRemoveUntil(
      NavigationPath.Loby,
      (route) => false,
    );
  }
}

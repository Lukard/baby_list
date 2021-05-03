import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NavigationModule {
  @singleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey();
}

import 'package:baby_list/core/navigation/route_definition.dart';
import 'package:baby_list/feature/welcome/presentation/page/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:injectable/injectable.dart';

@injectable
class WelcomeRouteDefinition implements RouteDefinition {
  static final String _PATH = "/welcome";

  @override
  Route? call(RouteSettings settings) {
    if (settings.name == _PATH) {
      return MaterialPageRoute(
        builder: (context) => Welcome(),
        settings: settings,
      );
    }
    return null;
  }
}

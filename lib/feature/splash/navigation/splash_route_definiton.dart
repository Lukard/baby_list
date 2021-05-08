import 'package:baby_list/core/navigation/route_definition.dart';
import 'package:baby_list/feature/splash/presentation/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashRouteDefinition implements RouteDefinition {
  static const String _PATH = '/';

  @override
  Route? call(RouteSettings settings) {
    if (settings.name == _PATH) {
      return MaterialPageRoute(
        builder: (context) => Splash(),
        settings: settings,
      );
    }
    return null;
  }
}

import 'package:baby_list/core/navigation/route_definition.dart';
import 'package:baby_list/feature/loby/presentation/page/loby.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:injectable/injectable.dart';

@injectable
class LobyRouteDefinition implements RouteDefinition {
  static const String _PATH = "/loby";

  @override
  Route? call(RouteSettings settings) {
    if (settings.name == _PATH) {
      return MaterialPageRoute(
        builder: (context) => Loby(),
        settings: settings,
      );
    }
    return null;
  }
}

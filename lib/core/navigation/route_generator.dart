import 'package:baby_list/core/navigation/route_definition.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class RouteGenerator {
  final List<RouteDefinition> _routeDefinitions;

  RouteGenerator(this._routeDefinitions);

  RouteFactory? call() {
    return (settings) {
      return _routeDefinitions
          .map((routeDefinition) => routeDefinition(settings))
          .firstWhere((route) => route != null, orElse: () => null);
    };
  }
}

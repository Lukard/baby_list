import 'package:baby_list/core/navigation/route_definition.dart';
import 'package:baby_list/feature/detail/navigation/detail_route_definition.dart';
import 'package:baby_list/feature/list/navigation/list_route_definition.dart';
import 'package:baby_list/feature/loby/navigation/loby_route_definition.dart';
import 'package:baby_list/feature/splash/navigation/splash_route_definiton.dart';
import 'package:baby_list/feature/welcome/navigation/welcome_route_definition.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NavigationModule {
  @singleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey();

  List<RouteDefinition> routeDefinitions(
    SplashRouteDefinition splashRouteDefinition,
    WelcomeRouteDefinition welcomeRouteDefinition,
    LobyRouteDefinition lobyRouteDefinition,
    ListRouteDefinition listRouteDefinition,
    DetailRouteDefinition detailRouteDefinition,
  ) {
    return [
      splashRouteDefinition,
      welcomeRouteDefinition,
      lobyRouteDefinition,
      listRouteDefinition,
      detailRouteDefinition,
    ];
  }
}

import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:baby_list/core/navigation/route_generator.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/theme/xds_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby list',
      theme: theme,
      navigatorKey: getIt<GlobalKey<NavigatorState>>(),
      initialRoute: NavigationPath.Splash,
      onGenerateRoute: getIt<RouteGenerator>()(),
    );
  }
}

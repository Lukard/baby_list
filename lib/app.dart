import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:baby_list/core/navigation/route_generator.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/template/firebase_initializer.dart';
import 'package:baby_list/xds/theme/xds_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirebaseInitializer(
      child: MaterialApp(
        title: 'Baby list',
        theme: theme,
        navigatorKey: navigatorKey,
        initialRoute: NavigationPath.Splash,
        onGenerateRoute: getIt<RouteGenerator>()(),
      ),
    );
  }
}

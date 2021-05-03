import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:baby_list/feature/detail/presentation/page/detail.dart';
import 'package:baby_list/feature/list/presentation/page/baby_list.dart';
import 'package:baby_list/feature/loby/presentation/page/loby.dart';
import 'package:baby_list/feature/splash/presentation/page/splash.dart';
import 'package:baby_list/feature/welcome/presentation/page/welcome.dart';
import 'package:baby_list/get_it.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: getIt<GlobalKey<NavigatorState>>(),
      initialRoute: NavigationPath.Splash,
      routes: {
        NavigationPath.Splash: (context) => Splash(),
        NavigationPath.Welcome: (context) => Welcome(),
        NavigationPath.Loby: (context) => Loby(),
        NavigationPath.List: (context) => BabyList(),
        NavigationPath.Detail: (context) => Detail(),
      },
    );
  }
}

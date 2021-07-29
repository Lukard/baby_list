import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:baby_list/core/navigation/route_definition.dart';
import 'package:baby_list/feature/signup/presentation/page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpRouteDefinition implements RouteDefinition {
  static const String _PATH = NavigationPath.SignUp;

  @override
  Route? call(RouteSettings settings) {
    if (settings.name == _PATH) {
      return MaterialPageRoute(
        builder: (context) => SignUpPage(),
        settings: settings,
      );
    }
    return null;
  }
}

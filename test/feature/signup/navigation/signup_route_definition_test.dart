import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:baby_list/feature/signup/navigation/signup_route_definition.dart';
import 'package:baby_list/feature/signup/presentation/page/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'signup_route_definition_test.mocks.dart';

final SignUpRouteDefinition routeDefinition = SignUpRouteDefinition();

@GenerateMocks([BuildContext])
void main() {
  test('when signup path when should return route', () {
    final BuildContext buildContext = MockBuildContext();
    final RouteSettings settings = RouteSettings(name: NavigationPath.SignUp);

    MaterialPageRoute? result = routeDefinition(settings) as MaterialPageRoute?;

    expect(result!.builder(buildContext), isA<SignUpPage>());
  });

  test('when other path than signup should return null', () {
    final RouteSettings settings = RouteSettings(name: NavigationPath.Welcome);

    Route? result = routeDefinition(settings);

    expect(result, isNull);
  });
}

import 'package:baby_list/core/navigation/navigation_path.dart';
import 'package:baby_list/feature/signup/navigation/loby_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'loby_navigator_test.mocks.dart';

@GenerateMocks([GlobalKey, NavigatorState, Route])
void main() {
  GlobalKey<NavigatorState> _navigatorKey = MockGlobalKey();
  LobyNavigator _lobyNavigator = LobyNavigator(_navigatorKey);

  test('should push to Loby without keeping previous navigation', () {
    MockRoute route = MockRoute();
    MockNavigatorState state = MockNavigatorState();
    when(_navigatorKey.currentState).thenReturn(state);
    when(state.pushNamedAndRemoveUntil(any, any))
        .thenAnswer((realInvocation) => Future.value());
    //when(state.pushNamedAndRemoveUntil('/loby', (Route<dynamic>) => bool, arguments: null);

    _lobyNavigator();

    expect(
        verify(state.pushNamedAndRemoveUntil(
          NavigationPath.Loby,
          captureAny,
        )).captured.first(route),
        false);
  });
}

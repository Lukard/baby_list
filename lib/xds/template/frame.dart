import 'package:baby_list/core/error/error_notifier.dart';
import 'package:baby_list/get_it.dart';
import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorState =
      getIt<GlobalKey<NavigatorState>>();

  Frame({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: getIt<ErrorNotifier>().generateNewKey(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _getChildWithProperBackNavigation(context),
      ),
    );
  }

  Widget _getChildWithProperBackNavigation(BuildContext context) {
    if (navigatorState.currentState?.canPop() ?? false) {
      return Stack(
        children: [
          child,
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withAlpha(64),
                    blurRadius: 4.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return child;
    }
  }
}

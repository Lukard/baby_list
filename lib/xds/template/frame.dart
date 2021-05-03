import 'package:baby_list/core/error/error_notifier.dart';
import 'package:baby_list/get_it.dart';
import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  final String title;
  final Widget child;

  const Frame({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: getIt<ErrorNotifier>().generateNewKey(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
      ),
    );
  }
}

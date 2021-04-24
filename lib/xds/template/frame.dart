import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  final String title;
  final Widget child;

  const Frame({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
      ),
    );
  }
}

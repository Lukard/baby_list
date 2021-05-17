import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseInitializer extends StatefulWidget {
  final Widget child;

  FirebaseInitializer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _FirebaseInitializerState createState() => _FirebaseInitializerState();
}

class _FirebaseInitializerState extends State<FirebaseInitializer> {
  late Future<FirebaseApp> initialization;

  @override
  void initState() {
    super.initState();
    initialization = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            throw Exception(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return widget.child;
          }

          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        });
  }
}

import 'package:baby_list/feature/welcome/presentation/page/welcome.dart';
import 'package:baby_list/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(Welcome());
}

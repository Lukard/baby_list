import 'package:baby_list/app.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/template/test_widget_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('es'), Locale('en')],
      path: 'asset/translations',
      fallbackLocale: Locale('en'),
      child: /*App(),*/ TestWidget(),
    ),
  );
}

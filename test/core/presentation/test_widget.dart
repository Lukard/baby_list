import 'package:baby_list/xds/theme/xds_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget Test({required Widget child}) {
  return EasyLocalization(
    supportedLocales: [Locale('en')],
    path: 'asset/translations',
    fallbackLocale: const Locale('en'),
    child: _Test(child: child),
  );
}

class _Test extends StatelessWidget {
  final Widget child;

  const _Test({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      debugDumpApp();
    });
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: theme,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: child,
      ),
    );
  }
}

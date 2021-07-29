import 'package:baby_list/feature/signup/presentation/organism/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SignUpForm(onSubmit: (_, __, ___) {}),
      ),
    );
  }
}

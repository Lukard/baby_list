import 'package:baby_list/feature/splash/domain/cubit/splash_cubit.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/template/frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashCubit cubit = getIt<SplashCubit>();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => cubit.checkUserLoggedIn());
    return BlocProvider(
      create: (context) => cubit,
      child: Frame(
        title: '¡Hola!',
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

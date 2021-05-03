// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:flutter/material.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/datasource/auth_data_source.dart' as _i5;
import 'core/data/datasource/list_data_source.dart' as _i3;
import 'core/di/error_module.dart' as _i14;
import 'core/di/firebase_module.dart' as _i15;
import 'core/di/navigation_module.dart' as _i16;
import 'core/error/error_notifier.dart' as _i11;
import 'feature/detail/domain/bloc/detail_bloc.dart' as _i7;
import 'feature/list/domain/bloc/list_bloc.dart' as _i9;
import 'feature/loby/domain/bloc/loby_bloc.dart' as _i10;
import 'feature/splash/domain/cubit/splash_cubit.dart' as _i12;
import 'feature/welcome/domain/bloc/welcome_bloc.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final errorModule = _$ErrorModule();
  final firebaseModule = _$FirebaseModule();
  final navigationModule = _$NavigationModule();
  gh.factory<_i3.ListDataSource>(
      () => _i3.ListDataSource(get<_i4.FirebaseFirestore>()));
  gh.factory<_i5.AuthDataSource>(
      () => _i5.AuthDataSource(get<_i6.FirebaseAuth>()));
  gh.factory<_i7.DetailBloc>(() => _i7.DetailBloc(get<_i5.AuthDataSource>(),
      get<_i3.ListDataSource>(), get<_i8.GlobalKey<_i8.NavigatorState>>()));
  gh.factory<_i9.ListBloc>(() => _i9.ListBloc(get<_i5.AuthDataSource>(),
      get<_i3.ListDataSource>(), get<_i8.GlobalKey<_i8.NavigatorState>>()));
  gh.factory<_i10.LobyBloc>(() => _i10.LobyBloc(
      get<_i5.AuthDataSource>(),
      get<_i3.ListDataSource>(),
      get<_i8.GlobalKey<_i8.NavigatorState>>(),
      get<_i11.ErrorNotifier>()));
  gh.factory<_i12.SplashCubit>(() => _i12.SplashCubit(
      get<_i5.AuthDataSource>(), get<_i8.GlobalKey<_i8.NavigatorState>>()));
  gh.factory<_i13.WelcomeBloc>(() => _i13.WelcomeBloc(
      get<_i5.AuthDataSource>(), get<_i8.GlobalKey<_i8.NavigatorState>>()));
  gh.singleton<_i11.ErrorNotifier>(errorModule.errorNotifier);
  gh.singleton<_i6.FirebaseAuth>(firebaseModule.auth);
  gh.singleton<_i4.FirebaseFirestore>(firebaseModule.firestore);
  gh.singleton<_i8.GlobalKey<_i8.NavigatorState>>(
      navigationModule.navigatorKey);
  return get;
}

class _$ErrorModule extends _i14.ErrorModule {}

class _$FirebaseModule extends _i15.FirebaseModule {}

class _$NavigationModule extends _i16.NavigationModule {}

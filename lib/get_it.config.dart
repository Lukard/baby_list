// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i11;
import 'package:flutter/material.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/datasource/auth_data_source.dart' as _i10;
import 'core/data/datasource/list_data_source.dart' as _i4;
import 'core/di/error_module.dart' as _i21;
import 'core/di/firebase_module.dart' as _i22;
import 'core/di/navigation_module.dart' as _i23;
import 'core/error/error_notifier.dart' as _i14;
import 'core/navigation/route_definition.dart' as _i15;
import 'core/navigation/route_generator.dart' as _i18;
import 'feature/detail/domain/bloc/detail_bloc.dart' as _i12;
import 'feature/detail/navigation/detail_route_definition.dart' as _i3;
import 'feature/list/domain/bloc/list_bloc.dart' as _i16;
import 'feature/list/navigation/list_route_definition.dart' as _i6;
import 'feature/loby/domain/bloc/loby_bloc.dart' as _i17;
import 'feature/loby/navigation/loby_route_definition.dart' as _i7;
import 'feature/splash/domain/cubit/splash_cubit.dart' as _i19;
import 'feature/splash/navigation/splash_route_definiton.dart' as _i8;
import 'feature/welcome/domain/bloc/welcome_bloc.dart' as _i20;
import 'feature/welcome/navigation/welcome_route_definition.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final errorModule = _$ErrorModule();
  final firebaseModule = _$FirebaseModule();
  final navigationModule = _$NavigationModule();
  gh.factory<_i3.DetailRouteDefinition>(() => _i3.DetailRouteDefinition());
  gh.factory<_i4.ListDataSource>(
      () => _i4.ListDataSource(get<_i5.FirebaseFirestore>()));
  gh.factory<_i6.ListRouteDefinition>(() => _i6.ListRouteDefinition());
  gh.factory<_i7.LobyRouteDefinition>(() => _i7.LobyRouteDefinition());
  gh.factory<_i8.SplashRouteDefinition>(() => _i8.SplashRouteDefinition());
  gh.factory<_i9.WelcomeRouteDefinition>(() => _i9.WelcomeRouteDefinition());
  gh.factory<_i10.AuthDataSource>(
      () => _i10.AuthDataSource(get<_i11.FirebaseAuth>()));
  gh.factory<_i12.DetailBloc>(() => _i12.DetailBloc(
      get<_i10.AuthDataSource>(),
      get<_i4.ListDataSource>(),
      get<_i13.GlobalKey<_i13.NavigatorState>>(),
      get<_i14.ErrorNotifier>()));
  gh.factory<List<_i15.RouteDefinition>>(() =>
      navigationModule.routeDefinitions(
          get<_i8.SplashRouteDefinition>(),
          get<_i9.WelcomeRouteDefinition>(),
          get<_i7.LobyRouteDefinition>(),
          get<_i6.ListRouteDefinition>(),
          get<_i3.DetailRouteDefinition>()));
  gh.factory<_i16.ListBloc>(() => _i16.ListBloc(get<_i10.AuthDataSource>(),
      get<_i4.ListDataSource>(), get<_i13.GlobalKey<_i13.NavigatorState>>()));
  gh.factory<_i17.LobyBloc>(() => _i17.LobyBloc(
      get<_i10.AuthDataSource>(),
      get<_i4.ListDataSource>(),
      get<_i13.GlobalKey<_i13.NavigatorState>>(),
      get<_i14.ErrorNotifier>()));
  gh.factory<_i18.RouteGenerator>(
      () => _i18.RouteGenerator(get<List<_i15.RouteDefinition>>()));
  gh.factory<_i19.SplashCubit>(() => _i19.SplashCubit(
      get<_i10.AuthDataSource>(), get<_i13.GlobalKey<_i13.NavigatorState>>()));
  gh.factory<_i20.WelcomeBloc>(() => _i20.WelcomeBloc(
      get<_i10.AuthDataSource>(), get<_i13.GlobalKey<_i13.NavigatorState>>()));
  gh.singleton<_i14.ErrorNotifier>(errorModule.errorNotifier);
  gh.singleton<_i11.FirebaseAuth>(firebaseModule.auth);
  gh.singleton<_i5.FirebaseFirestore>(firebaseModule.firestore);
  gh.singleton<_i13.GlobalKey<_i13.NavigatorState>>(
      navigationModule.navigatorKey);
  return get;
}

class _$ErrorModule extends _i21.ErrorModule {}

class _$FirebaseModule extends _i22.FirebaseModule {}

class _$NavigationModule extends _i23.NavigationModule {}

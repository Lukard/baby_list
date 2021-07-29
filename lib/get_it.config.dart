// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i14;
import 'package:flutter/material.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/datasource/auth_data_source.dart' as _i13;
import 'core/data/datasource/list_data_source.dart' as _i4;
import 'core/di/error_module.dart' as _i26;
import 'core/di/firebase_module.dart' as _i27;
import 'core/di/navigation_module.dart' as _i28;
import 'core/error/error_notifier.dart' as _i18;
import 'core/navigation/route_definition.dart' as _i19;
import 'core/navigation/route_generator.dart' as _i22;
import 'feature/detail/domain/bloc/detail_bloc.dart' as _i17;
import 'feature/detail/navigation/detail_route_definition.dart' as _i3;
import 'feature/list/domain/bloc/list_bloc.dart' as _i20;
import 'feature/list/navigation/list_route_definition.dart' as _i6;
import 'feature/loby/domain/bloc/loby_bloc.dart' as _i21;
import 'feature/loby/navigation/loby_route_definition.dart' as _i9;
import 'feature/signup/data/datasource/create_user_data_source.dart' as _i15;
import 'feature/signup/domain/bloc/signup_bloc.dart' as _i23;
import 'feature/signup/domain/usecase/create_user_use_case.dart' as _i16;
import 'feature/signup/navigation/loby_navigator.dart' as _i7;
import 'feature/signup/navigation/signup_route_definition.dart' as _i10;
import 'feature/splash/domain/cubit/splash_cubit.dart' as _i24;
import 'feature/splash/navigation/splash_route_definiton.dart' as _i11;
import 'feature/welcome/domain/bloc/welcome_bloc.dart' as _i25;
import 'feature/welcome/navigation/welcome_route_definition.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i7.LobyNavigator>(
      () => _i7.LobyNavigator(get<_i8.GlobalKey<_i8.NavigatorState>>()));
  gh.factory<_i9.LobyRouteDefinition>(() => _i9.LobyRouteDefinition());
  gh.factory<_i10.SignUpRouteDefinition>(() => _i10.SignUpRouteDefinition());
  gh.factory<_i11.SplashRouteDefinition>(() => _i11.SplashRouteDefinition());
  gh.factory<_i12.WelcomeRouteDefinition>(() => _i12.WelcomeRouteDefinition());
  gh.factory<_i13.AuthDataSource>(
      () => _i13.AuthDataSource(get<_i14.FirebaseAuth>()));
  gh.factory<_i15.CreateUserDataSource>(
      () => _i15.CreateUserDataSource(get<_i14.FirebaseAuth>()));
  gh.factory<_i16.CreateUserUseCase>(
      () => _i16.CreateUserUseCase(get<_i15.CreateUserDataSource>()));
  gh.factory<_i17.DetailBloc>(() => _i17.DetailBloc(
      get<_i13.AuthDataSource>(),
      get<_i4.ListDataSource>(),
      get<_i8.GlobalKey<_i8.NavigatorState>>(),
      get<_i18.ErrorNotifier>()));
  gh.factory<List<_i19.RouteDefinition>>(() =>
      navigationModule.routeDefinitions(
          get<_i11.SplashRouteDefinition>(),
          get<_i12.WelcomeRouteDefinition>(),
          get<_i9.LobyRouteDefinition>(),
          get<_i6.ListRouteDefinition>(),
          get<_i3.DetailRouteDefinition>(),
          get<_i10.SignUpRouteDefinition>()));
  gh.factory<_i20.ListBloc>(() => _i20.ListBloc(get<_i13.AuthDataSource>(),
      get<_i4.ListDataSource>(), get<_i8.GlobalKey<_i8.NavigatorState>>()));
  gh.factory<_i21.LobyBloc>(() => _i21.LobyBloc(
      get<_i13.AuthDataSource>(),
      get<_i4.ListDataSource>(),
      get<_i8.GlobalKey<_i8.NavigatorState>>(),
      get<_i18.ErrorNotifier>()));
  gh.factory<_i22.RouteGenerator>(
      () => _i22.RouteGenerator(get<List<_i19.RouteDefinition>>()));
  gh.factory<_i23.SignupBloc>(() =>
      _i23.SignupBloc(get<_i16.CreateUserUseCase>(), get<_i7.LobyNavigator>()));
  gh.factory<_i24.SplashCubit>(() => _i24.SplashCubit(
      get<_i13.AuthDataSource>(), get<_i8.GlobalKey<_i8.NavigatorState>>()));
  gh.factory<_i25.WelcomeBloc>(() => _i25.WelcomeBloc(
      get<_i13.AuthDataSource>(), get<_i8.GlobalKey<_i8.NavigatorState>>()));
  gh.singleton<_i18.ErrorNotifier>(errorModule.errorNotifier);
  gh.singleton<_i14.FirebaseAuth>(firebaseModule.auth);
  gh.singleton<_i5.FirebaseFirestore>(firebaseModule.firestore);
  gh.singleton<_i8.GlobalKey<_i8.NavigatorState>>(
      navigationModule.navigatorKey);
  return get;
}

class _$ErrorModule extends _i26.ErrorModule {}

class _$FirebaseModule extends _i27.FirebaseModule {}

class _$NavigationModule extends _i28.NavigationModule {}

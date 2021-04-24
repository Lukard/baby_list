// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/di/firebase_module.dart' as _i9;
import 'feature/list/data/datasource/list_data_source.dart' as _i3;
import 'feature/list/domain/bloc/list_bloc.dart' as _i7;
import 'feature/welcome/data/datasource/auth_data_source.dart' as _i5;
import 'feature/welcome/domain/bloc/welcome_bloc.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseModule = _$FirebaseModule();
  gh.factory<_i3.ListDataSource>(
      () => _i3.ListDataSource(get<_i4.FirebaseFirestore>()));
  gh.factory<_i5.AuthDataSource>(
      () => _i5.AuthDataSource(get<_i6.FirebaseAuth>()));
  gh.factory<_i7.ListBloc>(() => _i7.ListBloc(get<_i3.ListDataSource>()));
  gh.factory<_i8.WelcomeBloc>(() => _i8.WelcomeBloc(get<_i5.AuthDataSource>()));
  gh.singleton<_i6.FirebaseAuth>(firebaseModule.auth);
  gh.singleton<_i4.FirebaseFirestore>(firebaseModule.firestore);
  return get;
}

class _$FirebaseModule extends _i9.FirebaseModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:doti_starter/index.dart' as _i16;
import 'package:doti_starter/src/core/data/theme_storage.dart' as _i8;
import 'package:doti_starter/src/core/di/di_app_module.dart' as _i20;
import 'package:doti_starter/src/core/di/di_data_module.dart' as _i21;
import 'package:doti_starter/src/core/di/di_repository_module.dart' as _i19;
import 'package:doti_starter/src/features/auth/application/auth/auth_bloc.dart'
    as _i17;
import 'package:doti_starter/src/features/auth/application/register_form/register_form_bloc.dart'
    as _i13;
import 'package:doti_starter/src/features/auth/application/sign_in_form/sign_in_form_bloc.dart'
    as _i14;
import 'package:doti_starter/src/features/auth/application/sign_out/sign_out_bloc.dart'
    as _i15;
import 'package:doti_starter/src/features/auth/domain/i_auth_repository.dart'
    as _i11;
import 'package:doti_starter/src/features/auth/infrastructure/auth_interceptor.dart'
    as _i18;
import 'package:doti_starter/src/features/auth/infrastructure/auth_remote_service.dart'
    as _i7;
import 'package:doti_starter/src/features/auth/infrastructure/auth_repository.dart'
    as _i12;
import 'package:doti_starter/src/features/auth/infrastructure/credentials_storage/credentials_storage.dart'
    as _i9;
import 'package:doti_starter/src/features/auth/infrastructure/credentials_storage/secure_credentials_storage.dart'
    as _i10;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final repositoryModule = _$RepositoryModule();
    final dIAppModule = _$DIAppModule();
    final dIDataModule = _$DIDataModule();
    await gh.lazySingletonAsync<_i3.Box<dynamic>>(
      () => repositoryModule.openBox,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.Dio>(
      () => repositoryModule.httpClient,
      preResolve: true,
    );
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => repositoryModule.flutterSecureStorage);
    gh.lazySingleton<_i6.GlobalKey<_i6.NavigatorState>>(() => dIAppModule.key);
    gh.lazySingleton<_i7.IAuthRemoteService>(
        () => _i7.AuthRemoteService(gh<_i4.Dio>()));
    gh.lazySingleton<_i8.ThemeStorage>(() => dIDataModule.themeStorage);
    gh.lazySingleton<_i9.CredentialsStorage>(
        () => _i10.SecureCredentialsStorage(gh<_i5.FlutterSecureStorage>()));
    gh.lazySingleton<_i11.IAuthRepository>(() => _i12.AuthRepository(
          gh<_i9.CredentialsStorage>(),
          gh<_i7.IAuthRemoteService>(),
        ));
    gh.factory<_i13.RegisterFormBloc>(
        () => _i13.RegisterFormBloc(gh<_i11.IAuthRepository>()));
    gh.factory<_i14.SignInFormBloc>(
        () => _i14.SignInFormBloc(gh<_i11.IAuthRepository>()));
    gh.factory<_i15.SignOutBloc>(
        () => _i15.SignOutBloc(gh<_i11.IAuthRepository>()));
    gh.factory<_i16.ThemeRepository>(() =>
        repositoryModule.provideAccidentsRepository(gh<_i8.ThemeStorage>()));
    gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(gh<_i11.IAuthRepository>()));
    gh.factory<_i18.AuthInterceptor>(
        () => _i18.AuthInterceptor(gh<_i11.IAuthRepository>()));
    return this;
  }
}

class _$RepositoryModule extends _i19.RepositoryModule {}

class _$DIAppModule extends _i20.DIAppModule {}

class _$DIDataModule extends _i21.DIDataModule {}

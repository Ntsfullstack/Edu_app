// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/repositories/auth_repository/auth_repository.dart' as _i344;
import 'data/repositories/auth_repository/auth_repository.default.dart'
    as _i522;
import 'data/repositories/teacher_repository/teacher_repository.dart' as _i402;
import 'data/repositories/teacher_repository/teacher_repository.default.dart'
    as _i349;
import 'data/sources/local/local.dart' as _i193;
import 'data/sources/network/dio.dart' as _i288;
import 'data/sources/network/network.dart' as _i536;
import 'data/states/auth/auth_cubit.dart' as _i823;
import 'data/states/settings/settings_cubit.dart' as _i906;
import 'data/usecases/login.dart' as _i470;
import 'data/usecases/register.dart' as _i686;
import 'data/usecases/teacher/get_today_schedules.dart' as _i1008;
import 'data/usecases/verify_login_status.dart' as _i412;
import 'di.dart' as _i913;
import 'presenter/navigation/navigation.dart' as _i551;
import 'presenter/pages/home/cubit/teacher_home_cubit.dart' as _i317;
import 'presenter/pages/login/cubit/login_cubit.dart' as _i0;
import 'presenter/pages/register/cubit/register_cubit.dart' as _i9;
import 'presenter/pages/splash/cubit/splash_cubit.dart' as _i588;
import 'services/oauth_token_manager/oauth_token_manager.dart' as _i132;
import 'services/oauth_token_manager/oauth_token_manager.default.dart' as _i290;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i558.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    gh.singleton<_i823.AuthCubit>(() => _i823.AuthCubit());
    gh.singleton<_i906.SettingsCubit>(() => _i906.SettingsCubit());
    gh.singleton<_i551.AppRouter>(
        () => _i551.AppRouter(authBloc: gh<_i823.AuthCubit>()));
    gh.singleton<_i132.OauthTokenManager>(() => _i290.DefaultOauthTokenManager(
        flutterSecureStorage: gh<_i558.FlutterSecureStorage>()));
    gh.singleton<_i193.LocalDataSource>(() => _i193.LocalDataSource(
        flutterSecureStorage: gh<_i558.FlutterSecureStorage>()));
    gh.singleton<String>(
      () => registerModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i288.NetworkDio>(() => _i288.NetworkDio(
          tokenManager: gh<_i132.OauthTokenManager>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.singleton<_i536.NetworkDataSource>(
        () => _i536.NetworkDataSource(gh<_i288.NetworkDio>()));
    gh.singleton<_i344.AuthRepository>(() => _i522.DefaultAuthRepository(
          networkDataSource: gh<_i536.NetworkDataSource>(),
          oauthTokenManager: gh<_i132.OauthTokenManager>(),
        ));
    gh.singleton<_i470.LoginUseCase>(
        () => _i470.LoginUseCase(authRepository: gh<_i344.AuthRepository>()));
    gh.singleton<_i412.VerifyLoginStatusUseCase>(() =>
        _i412.VerifyLoginStatusUseCase(
            authRepository: gh<_i344.AuthRepository>()));
    gh.singleton<_i686.RegisterUseCase>(() =>
        _i686.RegisterUseCase(authRepository: gh<_i344.AuthRepository>()));
    gh.factory<_i9.RegisterCubit>(
        () => _i9.RegisterCubit(register: gh<_i686.RegisterUseCase>()));
    gh.lazySingleton<_i402.TeacherRepository>(
        () => _i349.DefaultTeacherRepository(gh<_i536.NetworkDataSource>()));
    gh.factory<_i588.SplashCubit>(() => _i588.SplashCubit(
          verifyLoginStatus: gh<_i412.VerifyLoginStatusUseCase>(),
          authCubit: gh<_i823.AuthCubit>(),
        ));
    gh.factory<_i1008.GetTodaySchedulesUseCase>(
        () => _i1008.GetTodaySchedulesUseCase(gh<_i402.TeacherRepository>()));
    gh.factory<_i0.LoginCubit>(
        () => _i0.LoginCubit(login: gh<_i470.LoginUseCase>()));
    gh.factory<_i317.TeacherHomeCubit>(
        () => _i317.TeacherHomeCubit(gh<_i1008.GetTodaySchedulesUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}

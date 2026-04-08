import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/data/states/settings/settings_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final provider = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
FutureOr<void> configureDependencies() => provider.init();

@module
abstract class RegisterModule {
  @singleton
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();

  @Named('baseUrl')
  @singleton
  String get baseUrl => "http://14.225.231.56:3000/";
}

class GlobalBlocProviders extends StatelessWidget {
  final Widget child;

  const GlobalBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>.value(
          value: provider.get<AuthCubit>(),
        ),
        BlocProvider<SettingsCubit>.value(
          value: provider.get<SettingsCubit>(),
        ),
      ],
      child: child,
    );
  }
}

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/splash/cubit/splash_cubit.dart';
import 'package:flutter_starter/presenter/pages/splash/cubit/splash_state.dart';

@RoutePage()
class SplashPage extends StatefulWidget implements AutoRouteWrapper {
  const SplashPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (ctx) => provider.get<SplashCubit>(),
      child: this,
    );
  }

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashCubit get _cubit => context.read<SplashCubit>();

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _cubit.checkLoginStatus();
    });
  }

  void _onSuccess(BuildContext context, SplashState state) {
    context.router.replaceAll([const MainRoute()]);
  }

  void _onError(BuildContext context, SplashState state) {
    context.router.replaceAll([const LoginRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listenWhen: (p, c) => p.status != c.status,
      listener: (context, state) {
        if (state.status == SplashStatus.success) {
          _onSuccess(context, state);
        } else if (state.status == SplashStatus.failure) {
          _onError(context, state);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container (
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Icon(
                  Icons.flutter_dash,
                  color: Colors.white,
                  size: 48,
                ),
              ),

              const SizedBox(height: 16),


              const Text('Checking login status...'),

            ],
          )
        ),
      ),
    );
  }
}

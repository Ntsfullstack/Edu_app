import 'package:auto_route/auto_route.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/presenter/pages/home/home.dart';
import 'package:flutter_starter/presenter/pages/login/login.dart';
import 'package:flutter_starter/presenter/pages/main/main_page.dart';
import 'package:flutter_starter/presenter/pages/setting/profile_detail.dart';
import 'package:flutter_starter/presenter/pages/setting/update_profile/update_profile_page.dart';
import 'package:flutter_starter/presenter/pages/setting/setting.dart';
import 'package:flutter_starter/presenter/pages/register/register.dart';
import 'package:flutter_starter/presenter/pages/schedule/schedule_page.dart';
import 'package:flutter_starter/presenter/pages/splash/splash.dart';
import 'package:injectable/injectable.dart';

part 'navigation.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  final AuthCubit _authBloc;

  AppRouter({
    required AuthCubit authBloc,
  }) : _authBloc = authBloc;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/register', page: RegisterRoute.page),
        AutoRoute(path: '/profile-detail', page: ProfileDetailRoute.page),
        AutoRoute(path: '/update-profile', page: UpdateProfileRoute.page),
        AutoRoute(
          path: '/dashboard',
          page: MainRoute.page,
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'schedule', page: ScheduleRoute.page),
            AutoRoute(path: 'notifications', page: NotificationsRoute.page),
            AutoRoute(path: 'settings', page: SettingsRoute.page),
          ],
        ),
      ];

  bool isUnauthorizedRoute(String routeName) => [
        LoginRoute.name,
        RegisterRoute.name,
      ].contains(routeName);

  bool isAuthorizedRoute(String routeName) => [
        MainRoute.name,
        HomeRoute.name,
        ScheduleRoute.name,
        NotificationsRoute.name,
        SettingsRoute.name,
        ProfileDetailRoute.name,
        UpdateProfileRoute.name,
      ].contains(routeName);

  @override
  List<AutoRouteGuard> get guards => [
        AutoRouteGuard.simple(
          (resolver, router) {
            final isAuthenticated = _authBloc.state.loggedIn;

            if (isAuthorizedRoute(resolver.routeName) && !isAuthenticated) {
              return resolver.redirect(LoginRoute(), replace: true);
            }

            if (isUnauthorizedRoute(resolver.routeName) && isAuthenticated) {
              return resolver.redirect(MainRoute(), replace: true);
            }

            resolver.next(true);
          },
        ),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
}

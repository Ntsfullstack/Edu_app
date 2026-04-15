import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/main/widgets/notifications/parent_alerts_view.dart';
import 'package:flutter_starter/presenter/pages/main/widgets/notifications/teacher_alerts_view.dart';

import 'package:flutter_starter/presenter/widgets/role_selector.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    final account = authState.account;

    // If not logged in, show a simple loader to avoid building a complex dashboard with null data
    // This prevents crashes during the logout transition.
    if (!authState.loggedIn || account == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    final role = account.role;

    final routes = [
      const HomeRoute(),
      if (role.isTeacher || role.isParent) const ScheduleRoute(),
      if (role.isTeacher || role.isParent) const NotificationsRoute(),
      const SettingsRoute(),
    ];

    final destinations = [
      const NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home, color: Color(0xff005BBF)),
        label: 'Trang chủ',
      ),
      if (role.isTeacher || role.isParent)
        const NavigationDestination(
          icon: Icon(Icons.book),
          selectedIcon: Icon(Icons.calendar_today, color: Color(0xff005BBF)),
          label: 'Bài tập',
        ),
      if (role.isTeacher || role.isParent)
        NavigationDestination(
          icon: const Icon(Icons.calendar_today),
          selectedIcon: const Icon(Icons.calendar_today_outlined, color: Color(0xff005BBF)),
          label: role.isTeacher ? 'lịch dạy' : 'lịch học',
        ),
      const NavigationDestination(
        icon: Icon(Icons.person_outline),
        selectedIcon: Icon(Icons.person, color: Color(0xff005BBF)),
        label: 'Cài đặt',
      ),
    ];

    return AutoTabsScaffold(
      routes: routes,
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            backgroundColor: Colors.white,
            elevation: 0,
            indicatorColor: const Color(0xff005BBF).withOpacity(0.1),
            destinations: destinations,
          ),
        );
      },
    );
  }
}

@RoutePage()
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return const RoleSelector(
      teacher: TeacherAlertsView(),
      parent: ParentAlertsView(),
      fallback: Center(child: Text('No alerts found')),
    );
  }
}

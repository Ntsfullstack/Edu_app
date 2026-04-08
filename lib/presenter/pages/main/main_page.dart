import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/user_role.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/main/widgets/notifications/parent_alerts_view.dart';
import 'package:flutter_starter/presenter/pages/main/widgets/notifications/teacher_alerts_view.dart';
import 'package:flutter_starter/presenter/pages/main/widgets/schedule/student_schedule_view.dart';
import 'package:flutter_starter/presenter/pages/main/widgets/schedule/teacher_schedule_view.dart';
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
    final role = context.watch<AuthCubit>().state.account?.role ?? UserRole.student;

    final routes = [
      const HomeRoute(),
      if (role.isTeacher || role.isStudent) const ScheduleRoute(),
      if (role.isTeacher || role.isParent) const NotificationsRoute(),
      const SettingsRoute(),
    ];

    final destinations = [
      const NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home, color: Color(0xff005BBF)),
        label: 'Home',
      ),
      if (role.isTeacher || role.isStudent)
        const NavigationDestination(
          icon: Icon(Icons.calendar_today_outlined),
          selectedIcon: Icon(Icons.calendar_today, color: Color(0xff005BBF)),
          label: 'Schedule',
        ),
      if (role.isTeacher || role.isParent)
        const NavigationDestination(
          icon: Icon(Icons.notifications_outlined),
          selectedIcon: Icon(Icons.notifications, color: Color(0xff005BBF)),
          label: 'Alerts',
        ),
      const NavigationDestination(
        icon: Icon(Icons.person_outline),
        selectedIcon: Icon(Icons.person, color: Color(0xff005BBF)),
        label: 'Profile',
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
class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return const RoleSelector(
      teacher: TeacherScheduleView(),
      student: StudentScheduleView(),
      fallback: Center(child: Text('No schedule available for this role')),
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

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 64, color: Colors.blue),
            const SizedBox(height: 16),
            const RoleSelector(
              teacher: Text('Teacher Settings'),
              student: Text('Student Settings'),
              parent: Text('Parent Settings'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.read<AuthCubit>().loggedOut(),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

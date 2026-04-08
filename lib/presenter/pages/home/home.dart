import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/presenter/pages/home/widgets/parent_home_view.dart';
import 'package:flutter_starter/presenter/pages/home/widgets/student_home_view.dart';
import 'package:flutter_starter/presenter/pages/home/widgets/teacher_home_view.dart';
import 'package:flutter_starter/presenter/widgets/role_selector.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const RoleSelector(
      teacher: TeacherHomeView(),
      student: StudentHomeView(),
      parent: ParentHomeView(),
      fallback: StudentHomeView(),
    );
  }
}

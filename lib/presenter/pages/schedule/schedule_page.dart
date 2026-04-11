import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/presenter/pages/schedule/widgets/student_schedule_view.dart';
import 'package:flutter_starter/presenter/pages/schedule/widgets/teacher_schedule_view.dart';

import '../../widgets/role_selector.dart';
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
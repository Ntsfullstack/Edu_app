import 'package:flutter/material.dart';

class TeacherAlertsView extends StatefulWidget {
  const TeacherAlertsView({super.key});

  @override
  State<TeacherAlertsView> createState() => _TeacherAlertsViewState();
}

class _TeacherAlertsViewState extends State<TeacherAlertsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('System Alerts')),
      body: const Center(child: Text('Teacher Specific Notifications')),
    );
  }
}

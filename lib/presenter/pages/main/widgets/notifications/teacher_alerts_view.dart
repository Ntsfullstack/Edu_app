import 'package:flutter/material.dart';

class TeacherAlertsView extends StatelessWidget {
  const TeacherAlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('System Alerts')),
      body: const Center(child: Text('Teacher Specific Notifications')),
    );
  }
}

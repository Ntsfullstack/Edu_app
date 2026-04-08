import 'package:flutter/material.dart';

class TeacherScheduleView extends StatelessWidget {
  const TeacherScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teaching Schedule')),
      body: const Center(child: Text('Teacher Schedule Content')),
    );
  }
}

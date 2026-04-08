import 'package:flutter/material.dart';

class StudentScheduleView extends StatelessWidget {
  const StudentScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Class Schedule')),
      body: const Center(child: Text('Student Schedule Content')),
    );
  }
}

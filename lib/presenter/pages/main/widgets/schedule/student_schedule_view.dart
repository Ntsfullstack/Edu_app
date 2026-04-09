import 'package:flutter/material.dart';

class StudentScheduleView extends StatefulWidget {
  const StudentScheduleView({super.key});

  @override
  State<StudentScheduleView> createState() => _StudentScheduleViewState();
}

class _StudentScheduleViewState extends State<StudentScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Class Schedule')),
      body: const Center(child: Text('Student Schedule Content')),
    );
  }
}

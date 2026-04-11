import 'package:flutter/material.dart';

class TeacherScheduleView extends StatefulWidget {
  const TeacherScheduleView({super.key});

  @override
  State<TeacherScheduleView> createState() => _TeacherScheduleViewState();
}

class _TeacherScheduleViewState extends State<TeacherScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teaching Schedule')),
      body: const Center(child: Text('Teacher Schedule Content')),
    );
  }
}

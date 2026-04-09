import 'package:flutter/material.dart';

class ParentAlertsView extends StatefulWidget {
  const ParentAlertsView({super.key});

  @override
  State<ParentAlertsView> createState() => _ParentAlertsViewState();
}

class _ParentAlertsViewState extends State<ParentAlertsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Child Reports')),
      body: const Center(child: Text('Parent Specific Notifications')),
    );
  }
}

import 'package:flutter/material.dart';

class ParentAlertsView extends StatelessWidget {
  const ParentAlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Child Reports')),
      body: const Center(child: Text('Parent Specific Notifications')),
    );
  }
}

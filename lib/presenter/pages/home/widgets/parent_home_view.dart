import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';

class ParentHomeView extends StatefulWidget {
  const ParentHomeView({super.key});

  @override
  State<ParentHomeView> createState() => _ParentHomeViewState();
}

class _ParentHomeViewState extends State<ParentHomeView> {
  @override
  Widget build(BuildContext context) {
    final account = context.watch<AuthCubit>().state.account;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Portal'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text('Family Monitoring for ${account?.name}'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';

class StudentHomeView extends StatefulWidget {
  const StudentHomeView({super.key});

  @override
  State<StudentHomeView> createState() => _StudentHomeViewState();
}

class _StudentHomeViewState extends State<StudentHomeView> {
  @override
  Widget build(BuildContext context) {
    final account = context.watch<AuthCubit>().state.account;
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120.0,
            pinned: true,
            backgroundColor: const Color(0xff4CAF50),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('My Learning - ${account?.name}'),
            ),
          ),
          SliverToBoxAdapter(
            child: const Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(child: Text('Student Home Content')),
            ),
          ),
        ],
      ),
    );
  }
}

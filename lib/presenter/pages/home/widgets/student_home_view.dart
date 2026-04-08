import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/presenter/themes/extensions.dart';

class StudentHomeView extends StatelessWidget {
  const StudentHomeView({super.key});

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

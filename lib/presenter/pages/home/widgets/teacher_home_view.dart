import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/presenter/themes/extensions.dart';

class TeacherHomeView extends StatelessWidget {
  const TeacherHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final account = context.watch<AuthCubit>().state.account;
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFF),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xff005BBF),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Teacher Dashboard',
                style: context.typographies.heading.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              centerTitle: false,
              titlePadding: const EdgeInsetsDirectional.only(start: 24, bottom: 16),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome, Prof. ${account?.name}', style: context.typographies.heading.copyWith(fontSize: 24)),
                  const SizedBox(height: 24),
                  // Add Teacher specific widgets here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

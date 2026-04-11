import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/presenter/themes/extensions.dart';
import 'package:flutter_starter/presenter/pages/home/cubit/teacher_home_cubit.dart';
import 'package:flutter_starter/presenter/pages/home/state/teacher_home_state.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/data/entities/schedule.dart';

import '../component/schedule_item.dart';

class TeacherHomeView extends StatefulWidget {
  const TeacherHomeView({super.key});

  @override
  State<TeacherHomeView> createState() => _TeacherHomeViewState();
}

class _TeacherHomeViewState extends State<TeacherHomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          provider.get<TeacherHomeCubit>()..loadTodaySchedules(),
      child: const _TeacherHomeContent(),
    );
  }
}

class _TeacherHomeContent extends StatelessWidget {
  const _TeacherHomeContent();

  @override
  Widget build(BuildContext context) {
    final account = context.watch<AuthCubit>().state.account;

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFF),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 90.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xff005BBF),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Chào buổi sáng, ${account?.name}',
                style: context.typographies.heading.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              centerTitle: false,
              titlePadding:
                  const EdgeInsetsDirectional.only(start: 24, bottom: 16),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Thông báo mới
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Thông báo mới'),
                        const SizedBox(height: 8),
                        Text(
                          'Bạn có 3 thông báo chưa đọc.',
                          style: context.typographies.body,
                        ),
                      ],
                    ),
                  ),

                  // Chỉ số lớp và học sinh
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _StatCard(
                        icon: Icons.add,
                        value: '10',
                        label: 'Lớp học đang quản lý',
                      ),
                      const SizedBox(width: 16),
                      _StatCard(
                        icon: Icons.person,
                        value: '10',
                        label: 'học sinh đang quản lý',
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Text(
                        "Lịch dạy hôm nay",
                        style:
                            context.typographies.heading.copyWith(fontSize: 16),
                      ),
                      const Spacer(),
                      Text(
                        "Xem tất cả",
                        style: context.typographies.caption
                            .copyWith(color: const Color(0xff005BBF)),
                      )
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Danh sách lịch dạy dùng BlocBuilder
                  BlocBuilder<TeacherHomeCubit, TeacherHomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: CircularProgressIndicator(),
                        ));
                      }

                      if (state.error != null) {
                        return Center(child: Text(state.error!.message));
                      }

                      if (state.todaySchedules.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Text('Hôm nay bạn không có lịch dạy nào.'),
                          ),
                        );
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.todaySchedules.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final schedule = state.todaySchedules[index];
                          return ScheduleItem(schedule: schedule);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Bài tập đã giao",
                        style:
                        context.typographies.heading.copyWith(fontSize: 16),
                      ),
                      const Spacer(),
                      Text(
                        "Xem tất cả",
                        style: context.typographies.caption
                            .copyWith(color: const Color(0xff005BBF)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard(
      {required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: const Color(0xff005BBF)),
            const SizedBox(height: 12),
            Text(value,
                style: context.typographies.heading.copyWith(fontSize: 20)),
            const SizedBox(height: 4),
            Text(
              label,
              style: context.typographies.caption,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

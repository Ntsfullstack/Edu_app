import 'package:flutter_starter/presenter/themes/extensions.dart';

import '../../../../data/entities/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ScheduleItem extends StatelessWidget {
  final Schedule schedule;

  const ScheduleItem({required this.schedule});

  String _formatTime(String time) {
    return time.substring(0, 5);
  }

  @override
  Widget build(BuildContext context) {
    final startTime = _formatTime(schedule.shift.startTime);
    final endTime = _formatTime(schedule.shift.endTime);

    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffEEEEEE)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TIME BADGE
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xff005BBF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        startTime,
                        style: context.typographies.heading.copyWith(
                          fontSize: 14,
                          color: const Color(0xff005BBF),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'đến',
                        style:
                        context.typographies.caption.copyWith(fontSize: 10),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        endTime,
                        style: context.typographies.heading.copyWith(
                          fontSize: 14,
                          color: const Color(0xff005BBF),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// CLASS NAME
                Text(
                  schedule.classEntity.name,
                  style: context.typographies.heading.copyWith(fontSize: 16),
                ),

                const SizedBox(height: 6),

                /// SHIFT INFO
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      schedule.shift.name,
                      style: context.typographies.caption,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xff005BBF).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xffEEEEEE)),
                    ),
                    child: Center(
                      child: Text(
                        'Điểm danh',
                        style: context.typographies.caption
                            .copyWith(color: Colors.black),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
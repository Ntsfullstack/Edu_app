import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/schedule.dart';
import 'package:flutter_starter/core/exception.dart';

part 'teacher_home_state.freezed.dart';

@freezed
class TeacherHomeState with _$TeacherHomeState {
  const factory TeacherHomeState({
    @Default([]) List<Schedule> todaySchedules,
    @Default(false) bool isLoading,
    BaseException? error,
  }) = _TeacherHomeState;
}

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/usecases/teacher/get_today_schedules.dart';
import 'package:flutter_starter/presenter/pages/home/state/teacher_home_state.dart';
import 'package:flutter_starter/core/exception.dart';

@injectable
class TeacherHomeCubit extends Cubit<TeacherHomeState> {
  final GetTodaySchedulesUseCase _getTodaySchedules;

  TeacherHomeCubit(
    this._getTodaySchedules,
  ) : super(const TeacherHomeState());

  Future<void> loadTodaySchedules() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final schedules = await _getTodaySchedules(null);
      emit(state.copyWith(
        isLoading: false,
        todaySchedules: schedules,
      ));
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('TeacherHomeCubit Error: $e');
      }
      if (kDebugMode) {
        print(stackTrace);
      }
      emit(state.copyWith(
        isLoading: false,
        error: BaseException.from(e),
      ));
    }
  }
}

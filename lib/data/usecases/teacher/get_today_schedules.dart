import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/entities/schedule.dart';
import 'package:flutter_starter/data/repositories/teacher_repository/teacher_repository.dart';
import 'package:flutter_starter/core/use_case.dart';

@injectable
class GetTodaySchedulesUseCase extends UseCase<List<Schedule>, void> {
  final TeacherRepository _repository;

  GetTodaySchedulesUseCase(this._repository);

  @override
  Future<List<Schedule>> call(void params) {
    return _repository.getTodaySchedules();
  }
}

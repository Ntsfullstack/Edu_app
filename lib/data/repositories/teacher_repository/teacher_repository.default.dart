import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/entities/schedule.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:flutter_starter/data/repositories/teacher_repository/teacher_repository.dart';

@LazySingleton(as: TeacherRepository)
class DefaultTeacherRepository implements TeacherRepository {
  final NetworkDataSource _networkDataSource;

  DefaultTeacherRepository(this._networkDataSource);

  @override
  Future<List<Schedule>> getTodaySchedules() async {
    return await _networkDataSource.getTodaySchedules();
  }
}

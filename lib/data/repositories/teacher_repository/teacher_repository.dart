import 'package:flutter_starter/data/entities/schedule.dart';

abstract class TeacherRepository {
  Future<List<Schedule>> getTodaySchedules();
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/data/entities/class_entity.dart';
import 'package:flutter_starter/data/entities/shift.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Schedule({
    required String id,
    @JsonKey(name: 'class') required ClassEntity classEntity,
    required String classId,
    required int weekday,
    required Shift shift,
    required String shiftId,
    required Account teacher,
    required String teacherId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
}

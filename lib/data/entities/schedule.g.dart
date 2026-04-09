// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleImpl _$$ScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleImpl(
      id: json['id'] as String,
      classEntity: ClassEntity.fromJson(json['class'] as Map<String, dynamic>),
      classId: json['classId'] as String,
      weekday: (json['weekday'] as num).toInt(),
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      shiftId: json['shiftId'] as String,
      teacher: Account.fromJson(json['teacher'] as Map<String, dynamic>),
      teacherId: json['teacherId'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ScheduleImplToJson(_$ScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'class': instance.classEntity,
      'classId': instance.classId,
      'weekday': instance.weekday,
      'shift': instance.shift,
      'shiftId': instance.shiftId,
      'teacher': instance.teacher,
      'teacherId': instance.teacherId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

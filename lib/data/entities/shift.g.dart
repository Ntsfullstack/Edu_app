// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftImpl _$$ShiftImplFromJson(Map<String, dynamic> json) => _$ShiftImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ShiftImplToJson(_$ShiftImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

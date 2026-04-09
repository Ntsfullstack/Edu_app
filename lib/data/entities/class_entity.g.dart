// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassEntityImpl _$$ClassEntityImplFromJson(Map<String, dynamic> json) =>
    _$ClassEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      grade: json['grade'] as String?,
      academicYear: json['academicYear'] as String?,
      status: json['status'] as String?,
      maxStudents: (json['maxStudents'] as num?)?.toInt(),
      archivedAt: json['archivedAt'] == null
          ? null
          : DateTime.parse(json['archivedAt'] as String),
      clonedFromId: json['clonedFromId'] as String?,
      homeroomTeacherId: json['homeroomTeacherId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ClassEntityImplToJson(_$ClassEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'grade': instance.grade,
      'academicYear': instance.academicYear,
      'status': instance.status,
      'maxStudents': instance.maxStudents,
      'archivedAt': instance.archivedAt?.toIso8601String(),
      'clonedFromId': instance.clonedFromId,
      'homeroomTeacherId': instance.homeroomTeacherId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

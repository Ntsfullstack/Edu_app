// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      phoneNumber: json['phoneNumber'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      avatar: json['avatar'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      activeStudentId: json['activeStudentId'] as String?,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'role': _$UserRoleEnumMap[instance.role]!,
      'phoneNumber': instance.phoneNumber,
      'isActive': instance.isActive,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'activeStudentId': instance.activeStudentId,
    };

const _$UserRoleEnumMap = {
  UserRole.teacher: 'teacher',
  UserRole.student: 'student',
  UserRole.parent: 'parent',
  UserRole.admin: 'admin',
};

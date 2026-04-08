import 'package:freezed_annotation/freezed_annotation.dart';

enum UserRole {
  @JsonValue('teacher')
  teacher,
  @JsonValue('student')
  student,
  @JsonValue('parent')
  parent,
  @JsonValue('admin')
  admin;

  bool get isTeacher => this == UserRole.teacher;
  bool get isStudent => this == UserRole.student;
  bool get isParent => this == UserRole.parent;
  bool get isAdmin => this == UserRole.admin;

  String get label {
    switch (this) {
      case UserRole.teacher: return 'Teacher';
      case UserRole.student: return 'Student';
      case UserRole.parent: return 'Parent';
      case UserRole.admin: return 'Admin';
    }
  }
}

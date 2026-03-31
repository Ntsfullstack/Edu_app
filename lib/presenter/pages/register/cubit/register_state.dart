import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

enum RegisterStatus {
  initial,
  submitting,
  success,
  failure,
}

enum UserRole {
  teacher,
  parent,
  admin;

  String get value {
    switch (this) {
      case UserRole.teacher:
        return 'teacher';
      case UserRole.parent:
        return 'parent';
      case UserRole.admin:
        return 'admin';
    }
  }

  String get label {
    switch (this) {
      case UserRole.teacher:
        return 'Teacher';
      case UserRole.parent:
        return 'Parent';
      case UserRole.admin:
        return 'Admin';
    }
  }
}

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(UserRole.teacher) UserRole selectedRole,
    @Default(RegisterStatus.initial) RegisterStatus status,
    RegisterResponse? registerResponse,
    BaseException? error,
  }) = _RegisterState;
}

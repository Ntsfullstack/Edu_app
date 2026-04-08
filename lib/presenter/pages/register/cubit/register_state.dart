import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/data/entities/user_role.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

enum RegisterStatus {
  initial,
  submitting,
  success,
  failure,
}

// Removed local UserRole enum as it's now global in user_role.dart

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

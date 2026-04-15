import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_params.freezed.dart';
part 'register_params.g.dart';

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
    @JsonKey(name: 'phoneNumber') required String phoneNumber,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'role') required String role,
  }) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, Object?> json) =>
      _$RegisterParamsFromJson(json);
}

import 'package:flutter/foundation.dart';
import 'package:flutter_starter/data/entities/account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    required Account user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) => _$LoginResponseFromJson(json);
}

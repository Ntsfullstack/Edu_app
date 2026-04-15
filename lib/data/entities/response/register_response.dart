import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    @JsonKey(name: 'user') required Account user,
    @JsonKey(name: 'access_token') String? accessToken,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, Object?> json) =>
      _$RegisterResponseFromJson(json);
}

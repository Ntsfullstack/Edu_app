import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

/// Generic wrapper cho response object thuần (single resource) dạng:
/// ```json
/// {
///   "data": { ... },
///   "message": "Success"
/// }
/// ```
///
/// Nếu API trả thẳng `{}` không bọc thêm lớp "data", KHÔNG cần dùng class này —
/// Retrofit parse trực tiếp vào `fromJson` của model tương ứng.
///
/// Sử dụng trong retrofit:
/// ```dart
/// @POST('/users/profile')
/// Future<BaseResponse<UserDto>> updateProfile(@Body() UpdateProfileParams params);
/// ```
///
/// Trong repository:
/// ```dart
/// final res = await _network.updateProfile(params);
/// final user = res.data; // UserDto
/// ```
@Freezed(genericArgumentFactories: true)
class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    @JsonKey(name: 'data') T? data,
    @JsonKey(name: 'message') String? message,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(
    Map<String, Object?> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
}

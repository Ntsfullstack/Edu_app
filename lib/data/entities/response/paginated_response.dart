import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_response.freezed.dart';
part 'paginated_response.g.dart';

/// Generic paging wrapper cho response dạng:
/// ```json
/// {
///   "data": [...],
///   "total": 100,
///   "page": 1,
///   "limit": 20,
///   "totalPages": 5
/// }
/// ```
///
/// Sử dụng trong retrofit:
/// ```dart
/// @GET('/users')
/// Future<PaginatedResponse<UserDto>> getUsers(@Queries() Map<String, dynamic> params);
/// ```
///
/// Trong repository:
/// ```dart
/// final res = await _network.getUsers({'page': 1, 'limit': 20});
/// final users = res.data; // List<UserDto>
/// ```
@Freezed(genericArgumentFactories: true)
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    @JsonKey(name: 'data') required List<T> data,
    @JsonKey(name: 'total') required int total,
    @JsonKey(name: 'page') required int page,
    @JsonKey(name: 'limit') required int limit,
    @JsonKey(name: 'totalPages') required int totalPages,
  }) = _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(
    Map<String, Object?> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);
}

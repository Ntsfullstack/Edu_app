import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_params.freezed.dart';
part 'update_profile_params.g.dart';

@freezed
class UpdateProfileParams with _$UpdateProfileParams {
  const factory UpdateProfileParams({
    String? name,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
  }) = _UpdateProfileParams;

  factory UpdateProfileParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileParamsFromJson(json);
}

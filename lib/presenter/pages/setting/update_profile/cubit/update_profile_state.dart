import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_state.freezed.dart';

@freezed
class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState({
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isSuccess,
  }) = _UpdateProfileState;
}

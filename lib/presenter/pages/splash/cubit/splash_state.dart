import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

enum SplashStatus {
  initial,
  success,
  failure,
}

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(SplashStatus.initial) SplashStatus status,
  }) = _SplashState;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    SplashRedirectTo? redirectTo,
    @Default(false) bool showLoading,
  }) = _SplashState;
}

enum SplashRedirectTo { signIn, home }

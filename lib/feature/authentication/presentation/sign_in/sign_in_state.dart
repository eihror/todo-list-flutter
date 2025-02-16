import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/core/model/ui_email_error.dart';
import 'package:todo_list/core/model/ui_error.dart';
import 'package:todo_list/core/model/ui_password_error.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default("") String userEmail,
    @Default("") String userPassword,
    UiEmailError? uiEmailError,
    UiPasswordError? uiPasswordError,
    @Default(false) bool navigateToSignUpScreen,
    @Default(false) bool navigateToHomeScreen,
    @Default(false) bool showLoading,
    @Default(false) bool showSignInRequestError,
    UiError? signInRequestError,
  }) = _SignInState;
}

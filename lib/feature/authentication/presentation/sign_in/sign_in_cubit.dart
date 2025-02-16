import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/mixin/text_localization_mixin.dart';
import 'package:todo_list/core/model/ui_email_error.dart';
import 'package:todo_list/core/model/ui_error.dart';
import 'package:todo_list/core/model/ui_password_error.dart';
import 'package:todo_list/core/validator/email_validator.dart';
import 'package:todo_list/core/validator/password_validator.dart';
import 'package:todo_list/feature/authentication/domain/use_case/sign_in_use_case.dart';
import 'package:todo_list/feature/authentication/presentation/mapper/sign_in_ui_network_error_mapper.dart';
import 'package:todo_list/feature/authentication/presentation/sign_in/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> with TextLocalization {
  SignInCubit({
    required this.emailValidator,
    required this.passwordValidator,
    required this.signInUseCase,
    required this.signInUiNetworkErrorMapper,
  }) : super(const SignInState());

  final EmailValidator emailValidator;
  final PasswordValidator passwordValidator;
  final SignInUseCase signInUseCase;
  final SignInUiNetworkErrorMapper signInUiNetworkErrorMapper;

  void onUserEmailTextChanged(String value) {
    emit(
      state.copyWith(
        userEmail: value,
        uiEmailError: null,
      ),
    );
  }

  void onUserPasswordTextChanged(String value) {
    emit(
      state.copyWith(
        userPassword: value,
        uiPasswordError: null,
      ),
    );
  }

  void clickedOnSignUpButton() async {
    emit(
      state.copyWith(
        navigateToSignUpScreen: true,
      ),
    );
  }

  void clickedOnSignInButton() async {
    if (state.showLoading) {
      return;
    }

    emit(
      state.copyWith(
        showLoading: true,
      ),
    );

    final UiEmailError? emailError =
        emailValidator.validate(email: state.userEmail);
    final UiPasswordError? passwordError =
        passwordValidator.validate(password: state.userPassword);

    if (emailError != null || passwordError != null) {
      emit(
        state.copyWith(
          uiEmailError: emailError,
          uiPasswordError: passwordError,
          showLoading: false,
        ),
      );
      return;
    }

    final result = await signInUseCase(
      email: state.userEmail,
      password: state.userPassword,
    );

    result
      ..onSuccess((data) {
        emit(
          state.copyWith(
            navigateToHomeScreen: true,
            showLoading: false,
          ),
        );
      })
      ..onFailure((exception) {
        final signInUiErrorMapped = signInUiNetworkErrorMapper.map(exception);

        if (signInUiErrorMapped is AlertMessage) {
          emit(
            state.copyWith(
              showLoading: false,
              showSignInRequestError: true,
              signInRequestError: signInUiErrorMapped,
            ),
          );
        }

        if (signInUiErrorMapped is FieldMessage) {
          // There is nothing on the Sign In flow to handle errors on fields
        }
      });
  }

  void handleNavigateToHomeScreen() {
    emit(
      state.copyWith(
        navigateToHomeScreen: false,
      ),
    );
  }

  void handleNavigateToSignUpScreen() {
    emit(
      state.copyWith(
        navigateToSignUpScreen: false,
      ),
    );
  }

  void handleShowSignInErrorDialog() {
    emit(
      state.copyWith(
        showSignInRequestError: false,
      ),
    );
  }
}

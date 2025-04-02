import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/mixin/text_localization_mixin.dart';
import 'package:todo_list/core/model/ui_email_error.dart';
import 'package:todo_list/core/model/ui_error.dart';
import 'package:todo_list/core/model/ui_password_error.dart';
import 'package:todo_list/core/validator/email_validator.dart';
import 'package:todo_list/core/validator/password_validator.dart';
import 'package:todo_list/feature/authentication/data/repository/authentication_repository.dart';
import 'package:todo_list/feature/authentication/models/auth_credentials.dart';
import 'package:todo_list/feature/authentication/presentation/mapper/sign_in_ui_network_error_mapper.dart';
import 'package:todo_list/feature/authentication/presentation/sign_in/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> with TextLocalization {
  SignInCubit({
    required this.authenticationRepository,
    required this.signInUiNetworkErrorMapper,
  }) : super(const SignInState());

  final AuthenticationRepository authenticationRepository;
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
        EmailValidator.validate(email: state.userEmail);
    final UiPasswordError? passwordError =
        PasswordValidator.validate(password: state.userPassword);

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

    final credentials = AuthCredentials(
      email: state.userEmail,
      password: state.userPassword,
    );
    final result =
        await authenticationRepository.authenticate(credentials: credentials);

    result
      ..onSuccess((data) {
        emit(
          state.copyWith(
            navigateToHomeScreen: true,
            showLoading: false,
          ),
        );
        emit(state.copyWith(navigateToHomeScreen: false));
      })
      ..onFailure((exception) {
        final signInUiErrorMapped = signInUiNetworkErrorMapper.map(exception);

        if (signInUiErrorMapped is AlertMessage) {
          emit(
            state.copyWith(
              showLoading: false,
              signInRequestError: signInUiErrorMapped,
            ),
          );
          emit(
            state.copyWith(
              showLoading: false,
              signInRequestError: null,
            ),
          );
        }

        if (signInUiErrorMapped is FieldMessage) {
          // There is nothing on the Sign In flow to handle errors on fields
        }
      });
  }
}

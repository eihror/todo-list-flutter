import 'package:todo_list/feature/authentication/domain/use_case/verify_if_user_has_logged_use_case.dart';
import 'package:todo_list/feature/authentication/presentation/splash/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required this.verifyIfUserHasLoggedUseCase,
  }) : super(const SplashState());

  final VerifyIfUserHasLoggedUseCase verifyIfUserHasLoggedUseCase;

  void onInitScreen() async {
    if (state.showLoading) {
      return;
    }

    emit(
      state.copyWith(
        showLoading: true,
      ),
    );

    final response = await verifyIfUserHasLoggedUseCase();
    response
      ..onSuccess((data) {
        emit(
          state.copyWith(
            navigateToSignInScreen: !data,
            navigateToHomeScreen: data,
            showLoading: false,
          ),
        );
      })
      ..onFailure((exception) {
        // Update this code later
      });
  }

  void handleNavigateToSignInScreen() {
    emit(
      state.copyWith(
        navigateToSignInScreen: false,
      ),
    );
  }

  void handleNavigateToHomeScreen() {
    emit(
      state.copyWith(
        navigateToHomeScreen: false,
      ),
    );
  }
}

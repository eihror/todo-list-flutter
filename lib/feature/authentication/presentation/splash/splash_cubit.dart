import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/feature/authentication/data/repository/authentication_repository.dart';
import 'package:todo_list/feature/authentication/presentation/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required this.authenticationRepository,
  }) : super(const SplashState());

  final AuthenticationRepository authenticationRepository;

  void onInitScreen() async {
    if (state.showLoading) {
      return;
    }

    emit(
      state.copyWith(
        showLoading: true,
      ),
    );

    final response = await authenticationRepository.verifyIfUserHasLogged();
    response
      ..onSuccess((isLoggedIn) {
        emit(
          state.copyWith(
            redirectTo:
                isLoggedIn ? SplashRedirectTo.home : SplashRedirectTo.signIn,
            showLoading: false,
          ),
        );
        emit(
          state.copyWith(redirectTo: null),
        );
      })
      ..onFailure((exception) {
        emit(
          state.copyWith(
            redirectTo: SplashRedirectTo.signIn,
            showLoading: false,
          ),
        );
        emit(
          state.copyWith(redirectTo: null),
        );
      });
  }
}

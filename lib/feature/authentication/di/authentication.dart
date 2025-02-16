import 'package:get_it/get_it.dart';
import 'package:todo_list/feature/authentication/data/data_source/local/local_authentication_data_source.dart';
import 'package:todo_list/feature/authentication/data/data_source/local/local_authentication_data_source_impl.dart';
import 'package:todo_list/feature/authentication/data/data_source/remote/remote_authentication_data_source.dart';
import 'package:todo_list/feature/authentication/data/data_source/remote/remote_authentication_data_source_impl.dart';
import 'package:todo_list/feature/authentication/data/repository/authentication_repository_impl.dart';
import 'package:todo_list/feature/authentication/domain/repository/authentication_repository.dart';
import 'package:todo_list/feature/authentication/domain/use_case/sign_in_use_case.dart';
import 'package:todo_list/feature/authentication/domain/use_case/verify_if_user_has_logged_use_case.dart';
import 'package:todo_list/feature/authentication/presentation/mapper/sign_in_ui_network_error_mapper.dart';
import 'package:todo_list/feature/authentication/presentation/sign_in/sign_in_cubit.dart';
import 'package:todo_list/feature/authentication/presentation/splash/splash_cubit.dart';

class Authentication {
  static void registerDependencies() {
    GetIt.I.registerFactory<LocalAuthenticationDataSource>(
      () => LocalAuthenticationDataSourceImpl(
        sharedPreferences: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory<RemoteAuthenticationDataSource>(
      () => RemoteAuthenticationDataSourceImpl(
        network: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        localAuthenticationDataSource: GetIt.I(),
        remoteAuthenticationDataSource: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory(
      () => VerifyIfUserHasLoggedUseCase(
        repository: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory(
      () => SignInUseCase(
        repository: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory(() => SignInUiNetworkErrorMapper());

    GetIt.I.registerFactory(
      () => SplashCubit(
        verifyIfUserHasLoggedUseCase: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory(
      () => SignInCubit(
        emailValidator: GetIt.I(),
        passwordValidator: GetIt.I(),
        signInUseCase: GetIt.I(),
        signInUiNetworkErrorMapper: GetIt.I(),
      ),
    );
  }
}

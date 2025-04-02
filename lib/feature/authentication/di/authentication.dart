import 'package:get_it/get_it.dart';
import 'package:todo_list/feature/authentication/data/data_source/local/local_authentication_data_source.dart';
import 'package:todo_list/feature/authentication/data/data_source/remote/remote_authentication_data_source.dart';
import 'package:todo_list/feature/authentication/data/repository/authentication_repository.dart';
import 'package:todo_list/feature/authentication/presentation/mapper/sign_in_ui_network_error_mapper.dart';
import 'package:todo_list/feature/authentication/presentation/sign_in/sign_in_cubit.dart';
import 'package:todo_list/feature/authentication/presentation/splash/splash_cubit.dart';

class Authentication {
  static void registerDependencies() {
    GetIt.I.registerFactory<LocalAuthenticationDataSource>(
      () => LocalAuthenticationDataSource(
        sharedPreferences: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory<RemoteAuthenticationDataSource>(
      () => RemoteAuthenticationDataSource(
        network: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory<AuthenticationRepository>(
      () => AuthenticationRepository(
        localAuthenticationDataSource: GetIt.I(),
        remoteAuthenticationDataSource: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory(() => SignInUiNetworkErrorMapper());

    GetIt.I.registerFactory(
      () => SplashCubit(
        authenticationRepository: GetIt.I(),
      ),
    );

    GetIt.I.registerFactory(
      () => SignInCubit(
        authenticationRepository: GetIt.I(),
        signInUiNetworkErrorMapper: GetIt.I(),
      ),
    );
  }
}

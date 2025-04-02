import 'package:result_dart/result_dart.dart';
import 'package:todo_list/feature/authentication/data/data_source/local/local_authentication_data_source.dart';
import 'package:todo_list/feature/authentication/data/data_source/remote/remote_authentication_data_source.dart';
import 'package:todo_list/feature/authentication/models/auth_credentials.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required this.localAuthenticationDataSource,
    required this.remoteAuthenticationDataSource,
  });

  final LocalAuthenticationDataSource localAuthenticationDataSource;
  final RemoteAuthenticationDataSource remoteAuthenticationDataSource;

  AsyncResult<bool> verifyIfUserHasLogged() =>
      localAuthenticationDataSource.verifyIfUserHasLogged();

  AsyncResult<void> authenticate({
    required AuthCredentials credentials,
  }) async {
    return await remoteAuthenticationDataSource
        .authenticate(credentials: credentials)
        .map((result) => localAuthenticationDataSource
            .saveUserAccessTokenOnSharedPreferences(value: result.accessToken));
  }
}

import 'package:common/model/result.dart';
import 'package:network/exception/network_exception.dart';
import 'package:todo_list/feature/authentication/data/data_source/local/local_authentication_data_source.dart';
import 'package:todo_list/feature/authentication/data/data_source/remote/remote_authentication_data_source.dart';
import 'package:todo_list/feature/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required this.localAuthenticationDataSource,
    required this.remoteAuthenticationDataSource,
  });

  final LocalAuthenticationDataSource localAuthenticationDataSource;
  final RemoteAuthenticationDataSource remoteAuthenticationDataSource;

  @override
  Future<Result<bool>> verifyIfUserHasLogged() =>
      localAuthenticationDataSource.verifyIfUserHasLogged();

  @override
  Future<Result<void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteAuthenticationDataSource.signIn(
        email: email,
        password: password,
      );

      if (result.isSuccess && result.data != null) {
        localAuthenticationDataSource.saveUserAccessTokenOnSharedPreferences(
          value: result.data!.accessToken ?? "",
        );

        return Successful(data: null);
      } else {
        return Failure(exception: Exception("Something goes wrong on login"));
      }
    } on NetworkException catch (e) {
      return Failure(exception: e);
    }
  }
}

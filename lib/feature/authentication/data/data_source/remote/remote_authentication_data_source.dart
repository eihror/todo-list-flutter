import 'package:network/exception/network_exception.dart';
import 'package:network/network.dart';
import 'package:result_dart/result_dart.dart';
import 'package:todo_list/feature/authentication/models/auth_credentials.dart';
import 'package:todo_list/feature/authentication/models/auth_result.dart';

class RemoteAuthenticationDataSource {
  RemoteAuthenticationDataSource({
    required this.network,
  });

  final Network network;

  AsyncResult<AuthResult> authenticate({
    required AuthCredentials credentials,
  }) async {
    try {
      final response = await network.client.post<dynamic>(
        'auth/login',
        data: credentials.toJson(),
      );
      return AuthResult.fromJson(response.data).toSuccess();
    } on NetworkException catch (e) {
      return e.toFailure();
    }
  }
}

import 'package:common/model/result.dart';
import 'package:network/network.dart';
import 'package:todo_list/feature/authentication/data/data_source/model/sign_in_request.dart';
import 'package:todo_list/feature/authentication/data/data_source/model/sign_in_response.dart';
import 'package:todo_list/feature/authentication/data/data_source/remote/remote_authentication_data_source.dart';

class RemoteAuthenticationDataSourceImpl
    extends RemoteAuthenticationDataSource {
  RemoteAuthenticationDataSourceImpl({
    required this.network,
  });

  final Network network;

  @override
  Future<Result<SignInResponse>> signIn({
    required String email,
    required String password,
  }) async {
    final data = SignInRequest(email: email, password: password).toMap();

    final response = await network.client.post<dynamic>(
      'auth/login',
      data: data,
    );

    final result = Successful(data: SignInResponse.fromMap(response.data));

    return result;
  }
}

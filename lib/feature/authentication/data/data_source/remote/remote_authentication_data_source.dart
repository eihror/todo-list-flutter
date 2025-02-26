import 'package:common/model/result.dart';
import 'package:todo_list/feature/authentication/data/data_source/model/sign_in_response.dart';

abstract class RemoteAuthenticationDataSource {
  Future<Result<SignInResponse>> signIn({
    required String email,
    required String password,
  });
}

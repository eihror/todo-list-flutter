import 'package:common/model/result.dart';

abstract class AuthenticationRepository {
  Future<Result<bool>> verifyIfUserHasLogged();

  Future<Result<void>> signIn({
    required String email,
    required String password,
  });
}

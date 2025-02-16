import 'package:common/model/result.dart';

abstract class LocalAuthenticationDataSource {
  Future<Result<bool>> verifyIfUserHasLogged();

  Future<Result<void>> saveUserAccessTokenOnSharedPreferences({
    required String value,
  });
}

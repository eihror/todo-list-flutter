import 'package:common/model/result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/core/util/constants.dart';
import 'package:todo_list/feature/authentication/data/data_source/local/local_authentication_data_source.dart';

class LocalAuthenticationDataSourceImpl extends LocalAuthenticationDataSource {
  LocalAuthenticationDataSourceImpl({
    required this.sharedPreferences,
  });

  final SharedPreferencesAsync sharedPreferences;

  @override
  Future<Result<bool>> verifyIfUserHasLogged() async {
    // This was add just to show the complete flow
    await Future.delayed(const Duration(seconds: 3));
    final authentication = await sharedPreferences.getString(
      Constants.sp_access_token,
    );

    return Successful(data: authentication != null);
  }

  @override
  Future<Result<void>> saveUserAccessTokenOnSharedPreferences({
    required String value,
  }) async {
    await sharedPreferences.setString(Constants.sp_access_token, value);

    return Successful(data: null);
  }
}

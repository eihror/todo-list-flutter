import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/core/util/constants.dart';

class LocalAuthenticationDataSource {
  LocalAuthenticationDataSource({
    required this.sharedPreferences,
  });

  final SharedPreferencesAsync sharedPreferences;

  AsyncResult<bool> verifyIfUserHasLogged() async {
    // This was add just to show the complete flow
    await Future.delayed(const Duration(seconds: 3));
    final authentication = await sharedPreferences.getString(
      Constants.sp_access_token,
    );

    return Success(authentication != null);
  }

  AsyncResult<void> saveUserAccessTokenOnSharedPreferences({
    required String value,
  }) async {
    await sharedPreferences.setString(Constants.sp_access_token, value);

    return const Success(unit);
  }
}

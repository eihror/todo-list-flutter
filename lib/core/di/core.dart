import 'package:get_it/get_it.dart';
import 'package:network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

class Core {
  static void registerDependencies() {
    GetIt.I.registerSingleton(
      Network.createNetwork(
        baseUrl: 'http://10.0.2.2:3000/',
      ),
    );

    GetIt.I.registerLazySingleton(
      () => SharedPreferencesAsync(
        options: const SharedPreferencesAsyncAndroidOptions(
          backend: SharedPreferencesAndroidBackendLibrary.SharedPreferences,
          originalSharedPreferencesOptions:
              AndroidSharedPreferencesStoreOptions(
            fileName: 'todo_list_app_shared_preferences',
          ),
        ),
      ),
    );
  }
}

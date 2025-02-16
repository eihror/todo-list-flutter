import 'package:get_it/get_it.dart';
import 'package:todo_list/feature/home/presentation/home/home_cubit.dart';

class Home {
  static void registerDependencies() {
    GetIt.I.registerFactory(
      () => HomeCubit(),
    );
  }
}

import 'package:todo_list/core/di/core.dart';
import 'package:todo_list/feature/authentication/di/authentication.dart';
import 'package:todo_list/feature/home/di/home.dart';

class DI {
  static void registerDependencies() {
    Core.registerDependencies();
    Authentication.registerDependencies();
    Home.registerDependencies();
  }
}

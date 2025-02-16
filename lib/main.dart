import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/app.dart';
import 'package:todo_list/core/bloc/app_bloc_observer.dart';
import 'package:todo_list/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  DI.registerDependencies();
  runApp(const App());
}

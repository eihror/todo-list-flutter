import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/feature/authentication/presentation/navigation/authentication_routes.dart';
import 'package:todo_list/feature/authentication/presentation/navigation/splash_route.dart';
import 'package:todo_list/feature/home/presentation/navigation/home_routes.dart';

final navigationRouter = GoRouter(
  initialLocation: SplashRoute().path,
  debugLogDiagnostics: kDebugMode,
  routes: [
    ...authenticationRoutes,
    ...homeRoutes,
  ],
);

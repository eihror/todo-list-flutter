import 'package:go_router/go_router.dart';
import 'package:todo_list/feature/authentication/presentation/navigation/sign_in_route.dart';
import 'package:todo_list/feature/authentication/presentation/navigation/sign_up_route.dart';
import 'package:todo_list/feature/authentication/presentation/navigation/splash_route.dart';
import 'package:todo_list/feature/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:todo_list/feature/authentication/presentation/sign_up/sign_up_screen.dart';
import 'package:todo_list/feature/authentication/presentation/splash/splash_screen.dart';

final List<RouteBase> authenticationRoutes = [
  GoRoute(
    path: SplashRoute().path,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: SignInRoute().path,
    builder: (context, state) => const SignInScreen(),
  ),
  GoRoute(
    path: SignUpRoute().path,
    builder: (context, state) {
      final email = state.uri.queryParameters['email'] ?? "";
      return SignUpScreen(
        email: email,
      );
    },
  ),
];

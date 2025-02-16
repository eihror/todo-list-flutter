import 'package:todo_list/core/navigation/app_route.dart';

final class SignUpRoute extends AppRoute {
  SignUpRoute() : super(path: '/sign-up');

  SignUpRoute.withEmail({required String email})
      : super(path: '/sign-up?email=$email');
}

import 'package:go_router/go_router.dart';
import 'package:todo_list/feature/home/presentation/home/home_screen.dart';
import 'package:todo_list/feature/home/presentation/navigation/home_route.dart';

final List<RouteBase> homeRoutes = [
  GoRoute(
    path: HomeRoute().path,
    builder: (context, state) => const HomeScreen(),
  ),
];

abstract class AppRoute {
  final String path;

  AppRoute({required this.path});

  @override
  String toString() {
    return path;
  }
}
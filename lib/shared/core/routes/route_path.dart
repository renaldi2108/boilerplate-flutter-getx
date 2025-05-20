part of 'routes.dart';

class RoutePath {
  static final String userScreen = _generateRouteUser("main");
  static final String homeScreen = _generateRoute("home");

  static String _generateRoute(String namePath) => "/${namePath}_screen";
  static String _generateRouteUser(String namePath) => _generateRoute("${namePath}_user");
}
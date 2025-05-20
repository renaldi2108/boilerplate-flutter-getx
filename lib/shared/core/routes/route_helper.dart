part of 'routes.dart';

class RouteHelper {
  static final List<GetPage> routes = [
    GetPage(name: RoutePath.homeScreen, binding: UserBinding(),
        page: () => const MyHomePage(title: 'Flutter Demo Home Page')
    ),
  ];
}
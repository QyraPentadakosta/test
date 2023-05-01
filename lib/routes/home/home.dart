import '../../core/routes/base_routes.dart';
import '../../pages/home/view/home_view.dart';

class HomeRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: HomeView.routeName,
      clazz: const HomeView(),
    ),
  ];
}

import '../../core/routes/base_routes.dart';
import '../../pages/splash/view/splash_view.dart';

class SplashRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: SplashView.routeName,
      clazz: const SplashView(),
    ),
  ];
}

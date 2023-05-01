import '../../core/routes/base_routes.dart';
import '../../pages/login/view/login_view.dart';

class LoginRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: LoginView.routeName,
      clazz: const LoginView(),
    ),
  ];
}

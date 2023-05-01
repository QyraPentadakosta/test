import '../../core/routes/base_routes.dart';
import '../../pages/register/view/register_view.dart';

class RegisterRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: RegisterView.routeName,
      clazz: const RegisterView(),
    ),
  ];
}

import '../../core/routes/base_routes.dart';
import '../../pages/add_remove_interest/view/add_remove_interest_view.dart';

class AddRemoveInterestRoute {
  static List<BaseRoute> listRoute = [
    BaseRoute(
      routeName: AddRemoveInterestView.routeName,
      clazz: const AddRemoveInterestView(),
    ),
  ];
}

import 'dart:developer';

import '../core/routes/base_routes.dart';
import 'add_remove_interest/add_remove_interest.dart';
import 'home/home.dart';
import 'login/login.dart';
import 'register/register.dart';
import 'splash/route_splash.dart';

class AllRoute {
  static Map<String, BaseRoute> allRouteMap = {};

  List<BaseRoute> allRoute = [
    ...SplashRoute.listRoute,
    ...LoginRoute.listRoute,
    ...HomeRoute.listRoute,
    ...RegisterRoute.listRoute,
    ...AddRemoveInterestRoute.listRoute,
  ];

  void getKey() {
    if (allRouteMap.isNotEmpty) {
      return;
    }
    log("execute MAPPING");
    for (var e in allRoute) {
      allRouteMap[e.routeName] = e;
    }
    log("executed MAPPING");
  }
}

import 'package:flutter/material.dart';

import '../../routes/routes.dart';

enum RouteType { push, pushReplace, pushRemove }

Route<dynamic>? generateRoutes(RouteSettings settings) {
  AllRoute().getKey();
  return MaterialPageRoute(
    builder: (context) =>
        AllRoute.allRouteMap[settings.name]?.clazz ?? const SizedBox(),
    settings: settings,
  );
}

Future goToNamed(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required String routeName,
}) {
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacementNamed(context, routeName,
        arguments: arguments, result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
  return Navigator.pushNamed(context, routeName, arguments: arguments);
}

Future goTo(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required Widget page,
}) {
  var pageRoute = MaterialPageRoute(
    builder: (context) => page,
    settings: RouteSettings(name: "/${page.toString()}", arguments: arguments),
  );
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacement(context, pageRoute,
        result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushAndRemoveUntil(
      pageRoute,
      (route) => false,
    );
  }
  return Navigator.push(
    context,
    pageRoute,
  );
}

void goBack(BuildContext context) {
  return Navigator.of(context).pop();
}

import 'package:flutter/material.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/routes/routes.dart';
import '../../../application/constant/constant.dart';
import '../../home/view/home_view.dart';
import '../../login/view/login_view.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel(BuildContext context) {
    initState(context);
  }

  Future<void> checkLogin(BuildContext context) async {
    String? userName = await IStorage.getString(IConstant.userName);
    if (userName != '') {
      return goToNamed(context,
          routeName: HomeView.routeName, routeType: RouteType.pushRemove);
    }
    return goToLogin(context);
  }

  void goToLogin(BuildContext context) {
    goToNamed(context,
        routeName: LoginView.routeName, routeType: RouteType.pushRemove);
  }

  void initState(BuildContext context) {
    checkLogin(context);
  }
}

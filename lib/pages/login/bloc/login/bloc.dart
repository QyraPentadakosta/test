import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/constant/constant.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../domain/repository/user/entity/user_entity.dart';
import '../../../home/view/home_view.dart';
import '../../services/services_login.dart';
import 'event.dart';
import 'state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is DoLoginEvent) {
      UserEntity? loginData =
          await LoginServices().login(event.email, event.password);
      if (loginData != null) {
        await IStorage.setString(IConstant.email, loginData.email);
        await IStorage.setString(IConstant.idUser, loginData.id.toString());
        await IStorage.setString(IConstant.userName, loginData.userName);
        goToNamed(
          event.context,
          routeName: HomeView.routeName,
          routeType: RouteType.pushReplace,
        );
      } else {
        event.context.iShowSnackBar(
          title: "Login Failed",
          subTitle: "Email or Password is wrong",
          success: false,
        );
      }
    }
  }
}

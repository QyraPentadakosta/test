import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/constant/constant.dart';
import '../../../core/constant/constant.dart';
import '../../../core/routes/routes.dart';
import '../../home/view/home_view.dart';
import '../services/register_services.dart';
import 'event.dart';
import 'state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is DoRegister) {
      await RegisterServices().register(
        event.email,
        event.userName,
        event.password,
      );
      await IStorage.setString(IConstant.email, event.email);
      await IStorage.setString(IConstant.userName, event.userName);
      var id =
          await RegisterServices().getIdUser(event.userName, event.password);
      await IStorage.setString(IConstant.idUser, id.toString());
      goToNamed(
        event.context,
        routeName: HomeView.routeName,
        routeType: RouteType.pushReplace,
      );
    }
  }
}

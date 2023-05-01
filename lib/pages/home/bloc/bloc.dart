import 'package:bloc/bloc.dart';

import '../../../application/constant/constant.dart';
import '../../../core/constant/constant.dart';
import '../model/model_user.dart';
import '../services/home_services.dart';
import 'event.dart';
import 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetDataProfileEvent) {
      String email = await IStorage.getString(IConstant.email) ?? "";
      String userName = await IStorage.getString(IConstant.userName) ?? "";
      String id = await IStorage.getString(IConstant.idUser) ?? "0";
      var resp = await HomeServices().getProfile(int.tryParse(id) ?? 0);
      if (resp != null) {
        yield SuccessHomeSaveProfile(profile: resp);
      } else {
        yield HomeSuccessState(
          modelUser: ModelUser(
            email: email,
            id: int.tryParse(id) ?? 0,
            userName: userName,
          ),
        );
      }
    } else if (event is GetDataProfileImageEvent) {
      // int id = event.props[0] as int;
    } else if (event is SaveActionProfileState) {
      yield LoadingHomeSaveProfile(loading: true);
      await HomeServices().saveAboutProfile(
        idUser: event.idUser,
        profile: event.profile,
      );
      yield SuccessHomeSaveProfile(profile: event.profile);
    }
  }
}

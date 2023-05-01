import 'package:flutter/material.dart';

import '../../../application/constant/constant.dart';
import '../../../core/constant/constant.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/routes/routes.dart';
import '../../login/view/login_view.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../model/model_about_profile.dart';
import '../utils/dob.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(BuildContext context) {
    initState(context);
  }

  bool isEditAbout = false;

  ModelAboutProfile modelAboutProfile = ModelAboutProfile(
    height: TextEditingController(),
    displayName: TextEditingController(),
    dob: TextEditingController(),
    gender: TextEditingController(),
    horoscope: TextEditingController(),
    weight: TextEditingController(),
    zodiac: TextEditingController(),
  );

  Future<void> logout(BuildContext context) async {
    var clear = await IStorage.clearAll();
    if (clear)
      return goToNamed(
        context,
        routeName: LoginView.routeName,
        routeType: RouteType.pushRemove,
      );
  }

  void iEditAbout() {
    isEditAbout = !isEditAbout;
    notifyListeners();
  }

  void getImageProfile(String? value) async {
    if (value != null) {
      modelAboutProfile.image = value;
      notifyListeners();
    }
  }

  Future goDataUser(HomeBloc bloc, BuildContext context) async {}

  void getHoroscope(String value) async {
    List<String> valueSplit = value.split(" ");
    int day = int.parse(valueSplit[0]);
    int month = int.parse(valueSplit[1]);
    String horoscope = Horoscope.get(day, month);
    modelAboutProfile.horoscope.text = horoscope;
    notifyListeners();
  }

  void getShio(String value) async {
    List<String> valueSplit = value.split(" ");
    int year = int.parse(valueSplit[2]);
    String shio = Horoscope.shio(year);
    modelAboutProfile.zodiac.text = shio;
    notifyListeners();
  }

  void countAge(String value) async {
    List<String> valueSplit = value.split(" ");
    int year = int.parse(valueSplit[2]);
    modelAboutProfile.age = Horoscope.age(year);
    notifyListeners();
  }

  Future saveActionProfile(HomeBloc bloc, BuildContext context) async {
    String? idUser = await IStorage.getString(IConstant.idUser);
    if (idUser == null) return;
    if (modelAboutProfile.displayName.text.isEmpty ||
        modelAboutProfile.dob.text.isEmpty ||
        modelAboutProfile.image!.isEmpty ||
        modelAboutProfile.height.text.isEmpty ||
        modelAboutProfile.weight.text.isEmpty ||
        modelAboutProfile.gender.text.isEmpty) {
      context.iShowSnackBar(
        title: "Please fill in the data",
        success: false,
      );
      return;
    }
    bloc.add(
      SaveActionProfileState(
          profile: modelAboutProfile, idUser: int.tryParse(idUser ?? "0") ?? 0),
    );
    isEditAbout = false;
    notifyListeners();
  }

  void setData(ModelAboutProfile data) {
    modelAboutProfile = data;
    notifyListeners();
  }

  void initState(BuildContext context) {}
}

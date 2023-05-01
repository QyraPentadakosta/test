import 'package:flutter/cupertino.dart';

import '../../../domain/repository/interest/InterestRepository.dart';
import '../../../domain/repository/profile/entity/profile_entity.dart';
import '../../../domain/repository/profile/profile_repository.dart';
import '../model/model_about_profile.dart';

class HomeServices {
  Future saveAboutProfile(
      {required int idUser, required ModelAboutProfile profile}) async {
    await ProfileRepository().addProfile(
      ProfileEntity(
        idUser: idUser,
        userName: profile.displayName.text,
        gender: profile.gender.text,
        image: profile.image ?? '',
        birthDate: profile.dob.text,
        horoscope: profile.horoscope.text,
        zodiac: profile.zodiac.text,
        height: profile.height.text,
        weight: profile.weight.text,
        age: profile.age ?? '',
      ),
    );
  }

  Future<ModelAboutProfile?> getProfile(int id) async {
    var resp = await ProfileRepository().getProfile(id);
    var interest = await InterestRepository().getInterests(id);
    if (resp != null) {
      return ModelAboutProfile(
        age: resp.age,
        displayName: TextEditingController.fromValue(
          TextEditingValue(text: resp.userName),
        ),
        zodiac: TextEditingController(text: resp.zodiac),
        weight: TextEditingController(text: resp.weight),
        horoscope: TextEditingController(text: resp.horoscope),
        gender: TextEditingController(text: resp.gender),
        dob: TextEditingController(text: resp.birthDate),
        height: TextEditingController(text: resp.height),
        image: resp.image,
        listInterest: interest,
      );
    }
    return null;
  }
}

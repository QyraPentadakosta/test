import '../../../domain/repository/interest/InterestRepository.dart';

class AddRemoveServices {
  Future addRemoveInterest(
      {required int idUser, required List<String> interest}) async {
    await InterestRepository().addInterest(idUser, interest);
  }

  Future<List<String>> getInterests(int idUser) async {
    return await InterestRepository().getInterests(idUser);
  }

  Future editInterest(int idUser, List<String> interest) async {
    await InterestRepository().editInterest(idUser, interest);
  }
}

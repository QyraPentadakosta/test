import '../../../domain/repository/user/entity/user_entity.dart';
import '../../../domain/repository/user/user_repository.dart';

class RegisterServices {
  Future register(String email, String userName, String password) async {
    await UserRepository().addUser(
      UserEntity(userName: userName, email: email, password: password),
    );
  }

  Future getIdUser(String userName, String password) async {
    List<UserEntity> resp =
        await UserRepository().loginUserName(userName, password);
    if (resp.isNotEmpty) {
      return resp[0].id;
    } else {
      return null;
    }
  }
}

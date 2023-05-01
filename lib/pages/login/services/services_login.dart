import '../../../domain/repository/user/entity/user_entity.dart';
import '../../../domain/repository/user/user_repository.dart';

class LoginServices {
  Future<UserEntity?> login(String email, String password) async {
    if (email.contains("@")) {
      List<UserEntity> resp =
          await UserRepository().loginEmail(email, password);
      if (resp.isNotEmpty) {
        return resp[0];
      } else {
        return null;
      }
    } else {
      List<UserEntity> resp =
          await UserRepository().loginUserName(email, password);
      if (resp.isNotEmpty) {
        return resp[0];
      } else {
        return null;
      }
    }
  }
}

import 'package:sqflite/sqflite.dart';

import '../../../core/db/config/config.dart';
import '../../table/table.dart';
import 'entity/user_entity.dart';

class UserRepository {
  Future addUser(UserEntity userEntity) async {
    final db = await DbConfig().createTableUser();
    var result = await db.insert(
      TableName.user.value,
      userEntity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(result);
  }

  Future<List<UserEntity>> loginEmail(String email, String password) async {
    final db = await DbConfig().createTableUser();
    final List<Map<String, dynamic>> maps = await db.query(
      TableName.user.value,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return List.generate(maps.length, (i) {
      return UserEntity(
        id: maps[i]['id'],
        userName: maps[i]['userName'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }

  Future<List<UserEntity>> loginUserName(
      String userName, String password) async {
    final db = await DbConfig().createTableUser();
    final List<Map<String, dynamic>> maps = await db.query(
      TableName.user.value,
      where: 'userName = ? AND password = ?',
      whereArgs: [userName, password],
    );
    return List.generate(maps.length, (i) {
      return UserEntity(
        id: maps[i]['id'],
        userName: maps[i]['userName'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }
}

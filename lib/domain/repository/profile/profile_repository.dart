import 'package:sqflite/sqflite.dart';

import '../../../core/db/config/config.dart';
import '../../table/table.dart';
import 'entity/profile_entity.dart';

class ProfileRepository {
  Future addProfile(ProfileEntity profileEntity) async {
    final db = await DbConfig().createTableProfile();
    await db.insert(
      TableName.profile.value,
      profileEntity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future updateProfile(ProfileEntity profileEntity) async {
    final db = await DbConfig().createTableProfile();
    await db.update(
      TableName.profile.value,
      profileEntity.toMap(),
      where: 'idUser = ?',
      whereArgs: [profileEntity.idUser],
    );
  }

  Future<ProfileEntity?> getProfile(int id) async {
    final db = await DbConfig().createTableProfile();
    final List<Map<String, dynamic>> maps = await db.query(
      TableName.profile.value,
      where: 'idUser = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return ProfileEntity.fromMap(maps.first);
    }
    return null;
  }
}

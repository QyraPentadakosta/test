import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import '../../../core/db/config/config.dart';
import '../../table/table.dart';

class InterestRepository {
  Future<List<String>> getInterests(int idUser) async {
    var db = await DbConfig().createTableInterest();
    final List<Map<String, dynamic>> maps = await db.query(
      TableName.interest.value,
      where: 'idUser = ?',
      whereArgs: [idUser],
    );
    if (maps.isNotEmpty) {
      List data = json.decode(maps[0]['interest']);
      List<String> dataList = data.map((e) => e.toString()).toList();
      // print(maps[0]['interest'].runtimeType);
      // print(data);
      return dataList;
      //   List.generate(maps.length, (i) {
      //   return maps[i]['interest'];
      // });
    }
    return [];
  }

  Future addInterest(int idUser, List<String> interest) async {
    var db = await DbConfig().createTableInterest();
    await db.insert(
      TableName.interest.value,
      {
        'idUser': idUser,
        'interest': json.encode(interest),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future editInterest(int idUser, List<String> interest) async {
    var db = await DbConfig().createTableInterest();
    await db.update(
      TableName.interest.value,
      {
        'idUser': idUser,
        'interest': json.encode(interest),
      },
      where: 'idUser = ?',
      whereArgs: [idUser],
    );
  }
}

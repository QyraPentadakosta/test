import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbConfig {
  Future createTableUser() async {
    WidgetsFlutterBinding.ensureInitialized();
    var db = await openDatabase(
      join(await getDatabasesPath(), 'data_db.db'),
      singleInstance: true,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE table_user(id INTEGER PRIMARY KEY AUTOINCREMENT, userName TEXT, email TEXT, password TEXT )',
        );
      },
      version: 1,
    );
    return db;
  }

  Future createTableProfile() async {
    WidgetsFlutterBinding.ensureInitialized();
    var db = await openDatabase(
      join(await getDatabasesPath(), 'data_dbx.db'),
      singleInstance: true,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE table_profile(id INTEGER PRIMARY KEY AUTOINCREMENT, idUser INTEGER, userName Text, gender Text , image LONGTEXT, birthDate TEXT, horoscope text, zodiac text, height text, weight text, age text)',
        );
      },
      version: 1,
    );
    return db;
  }

  Future createTableInterest() async {
    WidgetsFlutterBinding.ensureInitialized();
    var db = await openDatabase(
      join(await getDatabasesPath(), 'data_dbz.db'),
      singleInstance: true,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE table_interest(id INTEGER PRIMARY KEY AUTOINCREMENT, idUser INTEGER, interest TEXT)',
        );
      },
      version: 1,
    );
    return db;
  }
}

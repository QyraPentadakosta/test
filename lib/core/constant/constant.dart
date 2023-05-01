import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IStorage {
  static Future<bool> setString(String key, String value) async {
    var pref = await SharedPreferences.getInstance();
    var success = await pref.setString(key, value);
    if (kDebugMode) {
      log("Saving $key is $success");
    }
    return success;
  }

  static Future<String?> getString(String key) async {
    var pref = await SharedPreferences.getInstance();
    var val = pref.getString(key);
    if (val == null) {
      return "";
    }
    return val;
  }

  static Future clearAll() async {
    var pref = await SharedPreferences.getInstance();
    pref.clear();
    if (kDebugMode) {
      log("Success Clear All");
    }
    return true;
  }
}

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static void saveData(String? key, Object value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key!, value);
    } else if (value is String) {
      prefs.setString(key!, value);
    } else if (value is bool) {
      prefs.setBool(key!, value);
    } else if (value is List<String>) {
      prefs.setStringList(key!, value);
    }else{
      if (kDebugMode) {
        print("Invalid Type");
      }
    }
  }

  static Future<dynamic> readData(String? key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key!);
    return obj;
  }

  static Future<bool> deleteData(String? key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key!);
  }
  static Future<bool> deleteAllSharedPrefs() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
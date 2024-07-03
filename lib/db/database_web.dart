import 'dart:async';

import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._internal();
  static AppDatabase get instance => _singleton;

  Database? _dbOpenCompleter;

  AppDatabase._internal();

  Future<Database?> get database async {
    if (_dbOpenCompleter != null) {
      return _dbOpenCompleter;
    }
    _dbOpenCompleter = await _openDatabase();
    return _dbOpenCompleter;
  }

  Future<Database?> _openDatabase() async {
    final database = await databaseFactoryWeb.openDatabase('app.db');
    return database;
  }
}
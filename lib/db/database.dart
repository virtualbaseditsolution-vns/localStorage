
import 'package:assignment/db/user_table.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart' as p;


class MainDataBase{
  static final MainDataBase instance = MainDataBase._init();
  static Database? _database;
  MainDataBase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB('database.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, filePath);

    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
      return await databaseFactory.openDatabase(filePath,options: OpenDatabaseOptions(onCreate: UserTable.createDB,version: 1));
    }else{
      return await openDatabase(path, version: 1, onCreate: UserTable.createDB);
    }
  }

}

import 'package:assignment/db/user_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
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
    
    return await openDatabase(path, version: 1, onCreate: UserTable.createDB);
  }

}
import 'package:assignment/db/database.dart';
import 'package:sqflite/sqflite.dart';

import '../data/user/user_model.dart';

const String userTable = 'user';

class UserTableFields {
  static final List<String> values = [
    /// Add all fields
    id, createdTime, name, mobile, email, password, status
  ];

  static const String id = '_id';
  static const String createdTime = 'date';
  static const String name = 'name';
  static const String email = 'email';
  static const String mobile = 'mobile';
  static const String password = 'password';
  static const String status = 'status';
}


class UserTable{
  static Future createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const textNullType = 'TEXT NULL';
    const boolType = 'BOOLEAN NULL';
    // final integerType = 'INTEGER NOT NULL';
    // const integerNullType = 'INTEGER NULL';

    await db.execute('''
                      CREATE TABLE $userTable ( 
                        ${UserTableFields.id} $idType, 
                        ${UserTableFields.name} $textNullType, 
                        ${UserTableFields.mobile} $textNullType, 
                        ${UserTableFields.email} $textType,
                        ${UserTableFields.createdTime} $textType,
                        ${UserTableFields.password} $textType,
                        ${UserTableFields.status} $boolType
                        )
                      ''');
  }

}
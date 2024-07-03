import 'package:assignment/config/routes/routes_name.dart';
import 'package:assignment/utils/helpers.dart';
import 'package:assignment/utils/local_storage.dart';
import 'package:assignment/utils/user_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sembast/sembast.dart';

import '../../db/database.dart';
import '../../db/database_web.dart';
import '../../db/user_table.dart';
import 'user_model.dart';

class UserController extends GetxController {
  UserModel? user;
  bool isLoading = false;
  List<UserModel> users = [];

  Future<UserModel> insertNewUser(UserModel user) async {

    if(kIsWeb){
      final _store = stringMapStoreFactory.store('users');
      final _db = await AppDatabase.instance.database;
      await _store.record(user.email!).put(_db!, user.toJson());
      return user;
    }

    final db = await MainDataBase.instance.database;
    final id = await db!.insert(userTable, user.toJson());
    return user.copy(id: id);
  }

  Future loginWithEmail(String email, String password) async {
    if(kIsWeb){
      try{
        final _store = stringMapStoreFactory.store('users');
        final _db = await AppDatabase.instance.database;
        final record = await _store.record(email).getSnapshot(_db!);
        if (record != null) {
          final user = UserModel.fromJson(record.value);
          if (user.password == password) {
            UserHelper.saveEmail(user.email);
            UserHelper.saveMobile(user.mobile);
            UserHelper.savePassword(user.password);
            UserHelper.saveIsLogin("loginIn");
            update();
            Get.offAllNamed(RoutesName.dashboardScreen);
            // return UserModel.fromJson(maps.first);
          } else {
            Helpers.showToastMessage(message: "User Not found");
            return null;
          }
        }
      }catch(e){
        Helpers.showToastMessage(message: e.toString());
      }

    }else{
      try {
        final db = await MainDataBase.instance.database;
        final maps = await db!.query(
          userTable,
          columns: UserTableFields.values,
          where:
          '${UserTableFields.email} = ? and ${UserTableFields.password} = ?',
          whereArgs: [email, password],
        );

        if (maps.isNotEmpty) {
          user = UserModel.fromJson(maps.first);

          UserHelper.saveEmail(user!.email);
          UserHelper.saveMobile(user!.mobile);
          UserHelper.savePassword(user!.password);
          UserHelper.saveIsLogin("loginIn");

          update();
          Get.offAllNamed(RoutesName.dashboardScreen);
          // return UserModel.fromJson(maps.first);
        } else {
          Helpers.showToastMessage(message: "User Not found");
          // return null;
        }
      } catch (e) {
        Helpers.showToastMessage(message: e.toString());
      }
    }

  }

  Future getUserProfile()async{
    var email = await UserHelper.getEmail();
    var password = await UserHelper.getPassword();

    if(kIsWeb){
      final _store = stringMapStoreFactory.store('users');
      final _db = await AppDatabase.instance.database;
      final record = await _store.record(email!).getSnapshot(_db!);
      if (record != null) {
        user = UserModel.fromJson(record.value);
        update();
      }
      return;
    }
    final db = await MainDataBase.instance.database;
    final maps = await db!.query(
      userTable,
      columns: UserTableFields.values,
      where:
      '${UserTableFields.email} = ? and ${UserTableFields.password} = ?',
      whereArgs: [email, password],
    );
    if (maps.isNotEmpty) {
      user = UserModel.fromJson(maps.first);
      update();
    }
    print(user!.toJson());
  }

  Future getAllUsers() async {
    List<UserModel> u = [];
    isLoading = true;
    update();
    final db = await MainDataBase.instance.database;
    const orderBy = '${UserTableFields.createdTime} DESC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');
    final isTable = await db!.rawQuery(
        "SELECT COUNT(*) as total FROM sqlite_master WHERE type = ? AND name = ?",
        ["table", userTable]);
    int? t = isTable[0]['total'] as int;
    if (t > 0) {
      final result = await db.query(
        userTable,
        orderBy: orderBy,
      );
      users = result.map((json) => UserModel.fromJson(json)).toList();
    }
    isLoading = false;
    update();
  }

  Future hasUserLogin() async {
    var has = await UserHelper.getIsLogin();
    if (has != null) {
      await getUserProfile();
      Get.offAllNamed(RoutesName.dashboardScreen);
    } else {
      Get.offAllNamed(RoutesName.loginScreen);
    }
  }

  Future userLogout(context) async {
    var res = await Helpers.appConfirm(
        context: context, title: "Are you sure ?", subTitle: "Logout user");

    if (res == true) {
      await AppStorage.deleteData("isLogin");
      Get.offAllNamed(RoutesName.loginScreen);
    }
  }
}

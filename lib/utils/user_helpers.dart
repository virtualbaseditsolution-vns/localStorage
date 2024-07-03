

import 'dart:convert';

import 'local_storage.dart';










class UserHelper{

  static const String _userId = "userId";
  static const String _mobile = "mobile";
  static const String _email = "email";
  static const String _password = "password";
  static const String _isLogin = "isLogin";

  static Future saveUserId(data)async{
    AppStorage.saveData(_userId,data.toString());
  }

  static Future<String?> getUserId()async{
    var id = await AppStorage.readData(_userId);
    return id;
  }


  static Future saveMobile(data)async{
    AppStorage.saveData(_mobile,data.toString());
  }

  static Future<String?> getMobile()async{
    var mobile = await AppStorage.readData(_mobile);
    return mobile;
  }

  static Future saveEmail(data)async{
    AppStorage.saveData(_email,data.toString());
  }

  static Future<String?> getEmail()async{
    var email = await AppStorage.readData(_email);
    return email;
  }


  static Future savePassword(data)async{
    AppStorage.saveData(_password,data.toString());
  }

  static Future<String?> getPassword()async{
    var password = await AppStorage.readData(_password);
    return password;
  }

  static Future saveIsLogin(data)async{
    AppStorage.saveData(_isLogin,data.toString());
  }

  static Future<String?> getIsLogin()async{
    var loginIn = await AppStorage.readData(_isLogin);
    return loginIn;
  }



}
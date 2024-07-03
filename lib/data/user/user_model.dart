import '../../db/user_table.dart';

class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? password;
  final bool? status;
  final DateTime? createdTime;

  const UserModel({
    this.id,
    this.name,
    this.mobile,
    this.createdTime,
    this.email,
    this.password,
    this.status
  });

  UserModel copy({
    int? id,
    String? name,
    String? mobile,
    String? email,
    String? password,
    DateTime? createdTime,
    bool? status
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name??this.name,
        mobile: mobile??this.mobile,
        email: email?? this.email,
        password: password?? this.password,
        status: status?? false,
        createdTime: createdTime?? this.createdTime
      );

  static UserModel fromJson(Map<String, Object?> json) => UserModel(
    id: (json[UserTableFields.id]??0) as int,
    name: json[UserTableFields.name] as String,
    createdTime: DateTime.parse(json[UserTableFields.createdTime] as String),
    mobile: json[UserTableFields.mobile] as String,
    email: json[UserTableFields.email] as String,
    password: json[UserTableFields.password] as String,
    status: (json[UserTableFields.status]??false) as bool,
  );

  Map<String, dynamic> toJson() => {
    UserTableFields.id: id,
    UserTableFields.name: name,
    UserTableFields.email: email,
    UserTableFields.mobile: mobile,
    UserTableFields.password: password,
    UserTableFields.status: status,
    UserTableFields.createdTime: createdTime?.toIso8601String(),
  };
}
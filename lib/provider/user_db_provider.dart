// class UserInfoDbProvider extends BaseDbProvider {
//   final String name = 'UserInfo';

//   final String columnId = "_id";
//   final String columnUserName = "userName";
//   final String columnData = "data";

//   int? id;
//   String? userName;
//   String? data;

//   UserInfoDbProvider();

import 'package:hi_flutter/hi_flutter.dart';

import '../model/user.dart';

class UserDbProvider extends HiDbProvider {
  // UserDbProvider();
  // UserDbProvider.fromMap(super.map) : super.fromMap();

  @override
  String get tableName => 'User';

  // Future<User?> getUser(String key) async {
  //   var json = await getObject(key);
  //   if (json?.isEmpty ?? true) {
  //     return null;
  //   }
  //   return User.fromJson(json!);
  // }

  @override
  Future getObject(String key) async {
    var map = await super.getObject(key);
    var json = map as Map<String, dynamic>?;
    if (json?.isEmpty ?? true) {
      return null;
    }
    return User.fromJson(json!);
  }
}

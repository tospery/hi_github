// import 'dart:io';
// import 'package:hi_flutter/hi_flutter.dart';
// import '../model/user.dart';

// class DbManager {
//   static const _version = 1;
//   static const _name = 'app.db';

//   static Database? _db;

//   static init() async {
//     var path = await getDatabasesPath();
//     User? user;
//     String name = _name;
//     if (user != null) {

//     }
//     path += name;
//     if (Platform.isIOS) {
//       path += '/$name';
//     } else {
//       path += name;
//     }
//     log('【数据库】path = $path');
//     _db = await openDatabase(path, version: _version, onCreate: (database, version) {
//       log('数据库已创建');
//     });
//   }

//   static Future<bool> isTableExits(String tableName) async {
//     await getCurrentDatabase();
//     var res = await _db?.rawQuery("select * from Sqlite_master where type = 'table' and name = '$tableName'");
//     return res?.isNotEmpty ?? false;
//   }

//   static Future<Database?> getCurrentDatabase() async {
//     if (_db == null) {
//       await init();
//     }
//     return _db;
//   }

//   static close() {
//     _db?.close();
//     _db = null;
//   }

// }

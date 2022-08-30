import 'dart:io';
import 'package:sqflite/sqflite.dart';
import '../../core/hi_core.dart';

class HiDbManager {
  static const _version = 1;
  static const _name = 'app.db';

  static Database? _db;

  static init() async {
    var path = await getDatabasesPath();
    // var user;
    String name = _name;
    // if (user != null) {

    // }
    if (Platform.isIOS) {
      path += '/$name';
    } else {
      path += name;
    }
    log('path = $path', tag: HiLogTag.cache);
    _db = await openDatabase(path, version: _version,
        onCreate: (database, version) {
      log('数据库已创建', tag: HiLogTag.cache);
    });
  }

  static Future<bool> isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _db?.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res?.isNotEmpty ?? false;
  }

  static Future<Database> getCurrentDatabase() async {
    if (_db == null) {
      await init();
    }
    return _db!;
  }

  static close() {
    _db?.close();
    _db = null;
  }
}

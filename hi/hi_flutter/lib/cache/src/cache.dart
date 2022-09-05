import 'package:shared_preferences/shared_preferences.dart';
import '../../core/hi_core.dart';
import 'db/manager.dart';

class HiCache {
  SharedPreferences? _prefs;

  static HiCache? _instance;
  static HiCache shared() {
    _instance ??= HiCache._();
    return _instance!;
  }

  HiCache._() {
    _init();
  }

  void _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  HiCache._pre(SharedPreferences prefs) {
    _prefs = prefs;
  }

  static Future<HiCache> ready() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      // log('设置_prefs成功');
      _instance = HiCache._pre(prefs);
    }
    return _instance!;
  }

  setBool(String key, bool value) {
    _prefs?.setBool(key, value);
  }

  setInt(String key, int value) {
    _prefs?.setInt(key, value);
  }

  setDouble(String key, double value) {
    _prefs?.setDouble(key, value);
  }

  setString(String key, String value) {
    if (_prefs == null) {
      log('设置的时候_prefs为空');
    }
    _prefs?.setString(key, value);
  }

  setStringList(String key, List<String> value) {
    _prefs?.setStringList(key, value);
  }

  remove(String key) {
    _prefs?.remove(key);
  }

  T? get<T>(String key) {
    var result = _prefs?.get(key);
    if (result != null) {
      return result as T?;
    }
    return null;
  }

  //   Future<bool> store(String key, String data) async {
  //   Database db = await getDataBase();
  //   var provider = await _getProvider(db, key);
  //   if (provider != null) {
  //     await db.delete(tableName, where: '$columnKey = ?', whereArgs: [key]);
  //   }
  //   var result = await db.insert(tableName, toMap(key, data));
  //   return result != 0;
  // }
  Future<bool> store(String key, String data) async {
    return false;
  }

  Future<void> reset() async {
    await HiDbManager.close();
  }
}

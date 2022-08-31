import 'package:shared_preferences/shared_preferences.dart';
import '../../core/hi_core.dart';

class HiCache {
  SharedPreferences? _prefs;

  static HiCache? _instance;
  static HiCache shared() {
    _instance ??= HiCache._();
    return _instance!;
  }

  HiCache._() {
    init();
  }

  void init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  HiCache._pre(SharedPreferences prefs) {
    _prefs = prefs;
  }

  static Future<HiCache> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      log('设置_prefs成功');
      _instance = HiCache._pre(prefs);
    }
    return _instance!;
  }

  setString(String key, String value) {
    if (_prefs == null) {
      log('设置的时候_prefs为空');
    }
    _prefs?.setString(key, value);
  }

  setDouble(String key, double value) {
    _prefs?.setDouble(key, value);
  }

  setInt(String key, int value) {
    _prefs?.setInt(key, value);
  }

  setBool(String key, bool value) {
    _prefs?.setBool(key, value);
  }

  setStringList(String key, List<String> value) {
    _prefs?.setStringList(key, value);
  }

  remove(String key) {
    _prefs?.remove(key);
  }

  T? get<T>(String key) {
    if (_prefs == null) {
      log('_prefs是空的');
    } else {
      log('_prefs正常');
    }
    var result = _prefs?.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }
}

import 'package:package_info_plus/package_info_plus.dart';

class HiApp {
  PackageInfo? _packageInfo;

  static HiApp? _instance;
  static HiApp shared() {
    _instance ??= HiApp._();
    return _instance!;
  }

  HiApp._() {
    init();
  }

  void init() async {
    _packageInfo ??= await PackageInfo.fromPlatform();
  }

  HiApp._pre(PackageInfo prefs) {
    _packageInfo = prefs;
  }

  static Future<HiApp> preInit() async {
    if (_instance == null) {
      var prefs = await PackageInfo.fromPlatform();
      _instance = HiApp._pre(prefs);
    }
    return _instance!;
  }

  String get name => _packageInfo!.appName;
  String get version => _packageInfo!.version;
  String get buildNumber => _packageInfo!.buildNumber;
  String get packageName => _packageInfo!.packageName;
}

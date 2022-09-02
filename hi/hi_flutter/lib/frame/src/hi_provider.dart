typedef HiLoginFunc = int Function(Map<String, dynamic> parameters);

class HiProvider {
  static HiProvider? _instance;
  static HiProvider shared() {
    _instance ??= HiProvider._();
    return _instance!;
  }

  HiProvider._() {
    _initialize();
  }

  void _initialize() {}

  int login(HiLoginFunc func) {
    return func({});
  }
}

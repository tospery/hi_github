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
}

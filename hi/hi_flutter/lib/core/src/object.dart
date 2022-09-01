extension HiCoreObjectEx on Object {
  String get typeName => runtimeType.toString();
  String get instanceName => toString().split('.').last;
}

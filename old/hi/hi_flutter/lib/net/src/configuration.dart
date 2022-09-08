import '../../core/hi_core.dart';

typedef HiNetLoginFunc = Future<HiUser> Function(
  Map<String, dynamic> parameters,
);
typedef HiNetUserinfoFunc = HiNetLoginFunc;

class HiNetConfiguration {
  final List<String> codeKeys;
  final List<String> messageKeys;
  final List<String> dataKeys;
  final HiNetLoginFunc? loginFunc;
  final HiNetUserinfoFunc? userinfoFunc;

  HiNetConfiguration({
    this.codeKeys = const ['code'],
    this.messageKeys = const ['message'],
    this.dataKeys = const ['data'],
    this.loginFunc,
    this.userinfoFunc,
  });
}

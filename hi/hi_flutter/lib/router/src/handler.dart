import 'package:fluro/fluro.dart';
import 'core.dart';

class HiRouterHandler {
  final HiRouterType type;
  final HiRouterFunc func;

  HiRouterHandler({this.type = HiRouterType.route, required this.func});

  Handler get rawValue {
    return Handler(type: type.rawValue, handlerFunc: func);
  }
}

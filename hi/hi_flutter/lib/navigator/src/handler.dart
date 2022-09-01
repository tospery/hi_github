import 'package:fluro/fluro.dart';
import 'core.dart';

class HiNavigationHandler {
  final HiNavigationType type;
  final HiNavigationFunc func;

  HiNavigationHandler({this.type = HiNavigationType.route, required this.func});

  Handler get rawValue {
    return Handler(type: type.rawValue, handlerFunc: func);
  }
}

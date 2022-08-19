import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

typedef HiRouterFunc = Widget? Function(
    BuildContext? context, Map<String, List<String>> parameters);

enum HiRouterType {
  route,
  function;

  HandlerType get rawValue {
    switch (this) {
      case HiRouterType.route:
        return HandlerType.route;
      case HiRouterType.function:
        return HandlerType.function;
    }
  }
}

class HiRouterHandler {
  final HiRouterType type;
  final HiRouterFunc func;

  HiRouterHandler({this.type = HiRouterType.route, required this.func});

  Handler get rawValue {
    return Handler(type: type.rawValue, handlerFunc: func);
  }
}

enum HiTransitionType {
  push,
  present;

  TransitionType get rawValue {
    switch (this) {
      case HiTransitionType.push:
        return TransitionType.native;
      case HiTransitionType.present:
        return TransitionType.nativeModal;
      default:
        return TransitionType.none;
    }
  }
}

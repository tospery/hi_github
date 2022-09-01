import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

typedef HiNavigationFunc = Widget? Function(
    BuildContext? context, Map<String, List<String>> parameters);

enum HiNavigationType {
  route,
  function;

  HandlerType get rawValue {
    switch (this) {
      case HiNavigationType.route:
        return HandlerType.route;
      case HiNavigationType.function:
        return HandlerType.function;
    }
  }
}

enum HiTransitionMode {
  push,
  present;

  TransitionType get rawValue {
    switch (this) {
      case HiTransitionMode.push:
        return TransitionType.native;
      case HiTransitionMode.present:
        return TransitionType.nativeModal;
      default:
        return TransitionType.none;
    }
  }
}

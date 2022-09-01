import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:hi_flutter/core/hi_core.dart';

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

enum HiNavigationMode {
  push,
  present;

  TransitionType get rawValue {
    switch (this) {
      case HiNavigationMode.push:
        return TransitionType.native;
      case HiNavigationMode.present:
        return TransitionType.nativeModal;
      default:
        return TransitionType.none;
    }
  }

  factory HiNavigationMode.fromValue(dynamic value) {
    if (value is int) {
      if (value == 0) {
        return HiNavigationMode.push;
      }
      if (value == 1) {
        return HiNavigationMode.present;
      }
    }
    if (value is String) {
      if (value == HiNavigationMode.push.instanceName || value == '0') {
        return HiNavigationMode.push;
      }
      if (value == HiNavigationMode.present.instanceName || value == '1') {
        return HiNavigationMode.present;
      }
    }
    return HiNavigationMode.push;
  }
}

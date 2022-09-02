import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:hi_flutter/core/hi_core.dart';

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

enum HiRouterMode {
  push,
  present;

  TransitionType get rawValue {
    switch (this) {
      case HiRouterMode.push:
        return TransitionType.native;
      case HiRouterMode.present:
        return TransitionType.nativeModal;
      default:
        return TransitionType.none;
    }
  }

  factory HiRouterMode.fromValue(dynamic value) {
    if (value is int) {
      if (value == 0) {
        return HiRouterMode.push;
      }
      if (value == 1) {
        return HiRouterMode.present;
      }
    }
    if (value is String) {
      if (value == HiRouterMode.push.instanceName || value == '0') {
        return HiRouterMode.push;
      }
      if (value == HiRouterMode.present.instanceName || value == '1') {
        return HiRouterMode.present;
      }
    }
    return HiRouterMode.push;
  }
}

String hiUriString({
  required String host,
  String? path,
  Map<String, String>? queries,
}) =>
    Uri.https(host, path ?? '', queries).toString();

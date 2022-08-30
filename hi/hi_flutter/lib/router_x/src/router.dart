import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core.dart';

// mixin HiRouterCompatible {
//   String? defaultTitle(String path);
// }

// class HiRouterCompatible {
//   String? defaultTitle() {
//     return null;
//   }
// }

class HiRouter {
  // @override
  // VoidCallback? _myinit;

  // String? defaultTitle() {
  //   return 'abcd';
  // }


  final _router = FluroRouter();

  static HiRouter? _instance;
  static HiRouter shared() {
    _instance ??= HiRouter._();
    return _instance!;
  }

  HiRouter._() {
    _initialize();
  }

  void _initialize() {
    _router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      if (kDebugMode) {
        print("ROUTE WAS NOT FOUND !!!");
      }
      return;
    });
  }

  Route<dynamic>? generator(
    RouteSettings routeSettings,
  ) =>
      _router.generator(routeSettings);

  void define(
    String path, {
    required HiRouterHandler handler,
  }) =>
      _router.define(
        path,
        handler: handler.rawValue,
      );

  Future forward(
    BuildContext context,
    String path, {
    HiTransitionType? transition = HiTransitionType.push,
    Map<String, dynamic>? parameters,
  }) => navigateTo(
      context,
      path,
      transition: transition?.rawValue,
      routeSettings: RouteSettings(
        arguments: parameters,
      ),
    );

  Future push(
    BuildContext context,
    String path, {
    Map<String, dynamic>? parameters,
  }) =>
      forward(
        context,
        path,
        transition: HiTransitionType.push,
        parameters: parameters,
      );

  Future present(
    BuildContext context,
    String path, {
    Map<String, dynamic>? parameters,
  }) =>
      forward(
        context,
        path,
        transition: HiTransitionType.present,
        parameters: parameters,
      );

  void back<T>(BuildContext context, [T? result]) =>
      _router.pop(context, result);

  Future navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      TransitionType? transition,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) {
    return _router.navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      maintainState: maintainState,
      rootNavigator: rootNavigator,
      transition: transition,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      routeSettings: routeSettings,
    );
  }
}

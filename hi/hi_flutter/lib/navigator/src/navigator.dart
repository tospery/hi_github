import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hi_flutter/core/hi_core.dart';
import 'core.dart';
import 'handler.dart';

class HiNavigator {
  final _navigator = FluroRouter();

  static HiNavigator? _instance;
  static HiNavigator shared() {
    _instance ??= HiNavigator._();
    return _instance!;
  }

  HiNavigator._() {
    _initialize();
  }

  void _initialize() {
    _navigator.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      log('ROUTE WAS NOT FOUND !!!');
      return;
    });
  }

  Route<dynamic>? generator(
    RouteSettings routeSettings,
  ) =>
      _navigator.generator(routeSettings);

  void define(
    String path, {
    required HiNavigationHandler handler,
  }) =>
      _navigator.define(
        path,
        handler: handler.rawValue,
      );

  Future forward(
    BuildContext context,
    String path, {
    HiTransitionMode? transition = HiTransitionMode.push,
    Map<String, dynamic>? parameters,
  }) =>
      navigateTo(
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
        transition: HiTransitionMode.push,
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
        transition: HiTransitionMode.present,
        parameters: parameters,
      );

  void back<T>(BuildContext context, [T? result]) =>
      _navigator.pop(context, result);

  Future navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      TransitionType? transition,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) {
    return _navigator.navigateTo(
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

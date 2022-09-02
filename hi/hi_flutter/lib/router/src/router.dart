import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:hi_flutter/core/hi_core.dart';
import 'core.dart';
import 'handler.dart';

class HiRouter {
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
      log('ROUTE WAS NOT FOUND !!!');
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

  Future<dynamic> forward(
    BuildContext context,
    String uriString, {
    Map<String, dynamic> parameters = const {},
  }) {
    log('导航: $uriString');
    var uri = Uri.tryParse(uriString);
    Map<String, dynamic> myParameters = {};
    myParameters.addAll(parameters);
    myParameters.addAll(uri?.queryParameters ?? {});
    var root = myParameters.boolForKey(HiParameter.routerRoot) ?? false;
    var mode = HiRouterMode.fromValue(myParameters[HiParameter.routerMode]);
    return _router.navigateTo(
      context,
      uriString.removePrefix('app://'),
      replace: root,
      clearStack: root,
      transition: mode.rawValue,
      routeSettings: RouteSettings(arguments: myParameters),
    );
  }

  // Future push(
  //   BuildContext context,
  //   String uriString, {
  //   Map<String, dynamic> parameters = const {},
  // }) =>
  //     forward(
  //       context,
  //       uriString,
  //       parameters: parameters +
  //           {
  //             HiParameter.navigationMode: HiNavigationMode.push.toString(),
  //           },
  //     );

  // Future present(
  //   BuildContext context,
  //   String uriString, {
  //   Map<String, dynamic> parameters = const {},
  // }) =>
  //     forward(
  //       context,
  //       uriString,
  //       parameters: parameters +
  //           {
  //             HiParameter.navigationMode: HiNavigationMode.present.toString(),
  //           },
  //     );

  void back<T>(BuildContext context, [T? result]) =>
      _router.pop(context, result);
}

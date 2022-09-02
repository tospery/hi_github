import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

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
    String uriPattern, {
    required HiRouterHandler handler,
  }) =>
      _router.define(
        uriPattern,
        handler: handler.rawValue,
      );

  /// data存放无法放入uri的数据，如model
  Future<dynamic> forward(
    BuildContext context,
    String uriString, {
    Map<String, dynamic> data = const {},
  }) {
    log('导航: $uriString', tag: HiLogTag.router);
    var uri = Uri.tryParse(uriString);
    if (uri == null) {
      return Future.value(null);
    }
    Map<String, dynamic> parameters = {};
    parameters.addAll(uri.queryParameters);
    parameters.addAll(data);
    var root = parameters.boolForKey(HiParameter.routerRoot) ?? false;
    var mode = HiRouterMode.fromValue(parameters[HiParameter.routerMode]);
    return _router.navigateTo(
      context,
      uri.hostpath,
      replace: root,
      clearStack: root,
      transition: mode.rawValue,
      routeSettings: RouteSettings(arguments: parameters),
    );
  }

  Future<dynamic> push(
    BuildContext context,
    String uriString, {
    Map<String, dynamic> data = const {},
  }) {
    var uri = Uri.tryParse(uriString);
    if (uri == null) {
      return Future.value(null);
    }
    uri = uri.appending(
        queries: {HiParameter.routerMode: HiRouterMode.push.instanceName});
    return forward(context, uri.toString(), data: data);
  }

  Future<dynamic> present(
    BuildContext context,
    String uriString, {
    Map<String, dynamic> data = const {},
  }) {
    var uri = Uri.tryParse(uriString);
    if (uri == null) {
      return Future.value(null);
    }
    uri = uri.appending(
        queries: {HiParameter.routerMode: HiRouterMode.present.instanceName});
    return forward(context, uri.toString(), data: data);
  }

  void back<T>(BuildContext context, [T? result]) =>
      _router.pop(context, result);

  Future<dynamic> goLogin(BuildContext context) {
    return present(
      context,
      hiUriString(host: HiHost.login),
    );
  }
}

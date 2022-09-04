import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../../core/hi_core.dart';
import 'core.dart';
import 'handler.dart';
import 'host.dart';

class HiRouter {
  final _router = FluroRouter();

  HiRouterDefaultQueriesFunc? defaultQuerieFunc;
  HiRouterCheckLoginFunc? checkLoginFunc;
  HiRouterNeedLoginFunc? needLoginFunc;

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
    var uri = Uri.tryParse(uriString);
    if (uri == null) {
      return Future.value(null);
    }
    if (defaultQuerieFunc != null) {
      uri = defaultQuerieFunc!(uri);
    }
    log('导航: $uri, $data', tag: HiLogTag.router);
    if (uri.host == HiHost.login) {
      return goLogin(context);
    }
    if (needLoginFunc != null) {
      var isLogined = false;
      if (checkLoginFunc != null) {
        isLogined = checkLoginFunc!();
      }
      if (!isLogined && needLoginFunc!(uri)) {
        return goLogin(context).then(
          (value) => forward(
            context,
            uriString,
            data: data,
          ),
        );
      }
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
    return forward(
      context,
      uriString,
      data: data +
          {
            HiParameter.routerMode: HiRouterMode.push.instanceName,
          },
    );
  }

  Future<dynamic> present(
    BuildContext context,
    String uriString, {
    Map<String, dynamic> data = const {},
  }) {
    return forward(
      context,
      uriString,
      data: data +
          {
            HiParameter.routerMode: HiRouterMode.present.instanceName,
          },
    );
  }

  void back<T>(BuildContext context, [T? result]) =>
      _router.pop(context, result);

  Future<dynamic> resetRoot(
    BuildContext context,
    String uriString,
  ) {
    return forward(
      context,
      uriString,
      data: {
        HiParameter.routerRoot: true.toString(),
      },
    );
  }

  Future<dynamic> goLogin(BuildContext context) {
    return _router.navigateTo(
      context,
      HiHost.login,
      transition: HiRouterMode.present.rawValue,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/router/uri.dart';
import '../router/path.dart';

extension HiRouterEx on HiRouter {
  HiRouterHandler get routeHandler {
    return HiRouterHandler(
      type: HiRouterType.route,
      func: (BuildContext? context, Map<String, List<String>> parameters) {
        log('context参数: ${context?.settings}');
        log('parameters: $parameters');

        var name = (context?.settings?.name ?? '').removePrefix('/');
        log('name = $name');
        var uri = Uri.parse('higithub://$name');
        log('uri = $uri');
        Map<String, dynamic> params = {
          HiParameter.title: uri.defaultTitle(context),
        };
        params.addAll(uri.queryParameters);
        log('params1 = $params');
        params.addAll(
            (context?.settings?.arguments as Map<String, dynamic>?) ?? {});
        log('params2 = $params');
        params.addAll(parameters.singleValueMap);
        log('params3 = $params');

        return uri.page(parameters: params);
      },
    );
  }

  void configure() {
    define(HiRouterPath.root, handler: routeHandler);
    define(HiRouterPath.login, handler: routeHandler);
    define(HiRouterPath.home, handler: routeHandler);
    define(HiRouterPath.profile, handler: routeHandler);
    define(HiRouterPath.about, handler: routeHandler);
    define(HiRouterPathEx.oauth, handler: routeHandler);
  }
}

import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../extension/uri.dart';
import '../router/path.dart';

extension HiRouterEx on HiRouter {
  //   String? defaultTitle() {
  //   return '1234';
  // }

  HiRouterHandler get routeHandler {
    return HiRouterHandler(
      type: HiRouterType.route,
      func: (BuildContext? context, Map<String, List<String>> parameters) {
        log('【Router构建】context参数: ${context?.settings}');
        log('【Router构建】parameters: $parameters');

        var name = (context?.settings?.name ?? '').removePrefix('/');
        log('【Router构建】name = $name');
        var uri = Uri.parse('higithub://$name');
        log('【Router构建】uri = $uri');
        Map<String, dynamic> myParameters = {
          HiParameter.title: uri.defaultTitle(context),
        };
        myParameters.addAll(uri.queryParameters);
        log('【Router构建】params1 = $myParameters');
        myParameters.addAll(
            (context?.settings?.arguments as Map<String, dynamic>?) ?? {});
        log('【Router构建】params2 = $myParameters');
        myParameters.addAll(parameters.singleValueMap);
        log('【Router构建】params3 = $myParameters');

        return uri.page(context: context, parameters: myParameters);
      },
    );
  }

  void configure() {
    define(HiRouterPath.root, handler: routeHandler);
    define(HiRouterPath.login, handler: routeHandler);
    define(HiRouterPath.home, handler: routeHandler);
    define(HiRouterPath.profile, handler: routeHandler);
    define(HiRouterPath.about, handler: routeHandler);
    define(HiRouterPath.test, handler: routeHandler);
    define(HiRouterPathEx.oauth, handler: routeHandler);
  }
}

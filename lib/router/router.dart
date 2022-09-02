import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../extension/uri.dart';
import 'host.dart';

extension HiRouterEx on HiRouter {
  //   String? defaultTitle() {
  //   return '1234';
  // }

  HiRouterHandler get routeHandler {
    return HiRouterHandler(
      type: HiRouterType.route,
      func: (BuildContext? context, Map<String, List<String>> parameters) {
        // log('【Router构建】context参数: ${context?.settings}');
        // log('【Router构建】parameters: $parameters');

        var name = (context?.settings?.name ?? '').removePrefix('/');
        //log('【Router构建】name = $name');
        var uri = Uri.tryParse('higithub://$name')!;
        //log('【Router构建】uri = $uri');
        // Map<String, dynamic> myParameters = {
        //   HiParameter.title: uri.defaultTitle(context),
        // };
        // Map<String, dynamic> myParameters = {};
        // myParameters.addAll(uri.queryParameters);
        // log('【Router构建】params1 = $myParameters');
        // myParameters.addAll(
        //     (context?.settings?.arguments as Map<String, dynamic>?) ?? {});
        // log('【Router构建】params2 = $myParameters');
        // myParameters.addAll(parameters.singleValueMap);
        // log('【Router构建】params3 = $myParameters');

        Map<String, dynamic> myParameters = {};
        myParameters.addAll(
            (context?.settings?.arguments as Map<String, dynamic>?) ?? {});
        myParameters.addAll(parameters.singleValueMap);
        log('【Router构建】所有参数: $myParameters');
        return uri.page(context: context, parameters: myParameters);
      },
    );
  }

  void configure() {
    define(HiHost.root, handler: routeHandler);
    define(HiHost.login, handler: routeHandler);
    define(HiHost.home, handler: routeHandler);
    define(HiHost.profile, handler: routeHandler);
    define(HiHost.about, handler: routeHandler);
    define(HiHost.test, handler: routeHandler);
    define(HiHostEx.oauth, handler: routeHandler);
  }
}

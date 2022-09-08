import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/page/oauth_page.dart';
import 'package:hi_github/page/welcome_page.dart';
import 'package:hi_github/page/tabbar_page.dart';
import 'package:hi_github/page/test_page.dart';
import '../core/constant.dart';
import '../page/login_page.dart';
import '../page/user_page.dart';
import 'hi_host.dart';

extension UriRouter on Uri {
  Widget? page({
    BuildContext? context,
    Map<String, dynamic> parameters = const {},
  }) {
    var myParameters = parameters;
    if (host.isEmpty) {
      return WelcomePage(parameters: myParameters);
    }
    Widget? page;
    switch (host) {
      case HiHost.login:
        page = LoginPage(parameters: myParameters);
        break;
      case HiHost.home:
        page = const TabBarPage();
        break;
      case HiHost.user:
        page = UserPage(parameters: myParameters);
        break;
      // case HiRouterPath.about:
      //   page = AboutPage(parameters: parameters);
      //   break;
      case HiHost.test:
        page = const TestPage();
        break;
      case HiHostEx.oauth:
        page = OAuthPage(url: Github.oauthUrlString(), title: '授权标题');
        break;
      default:
        break;
    }
    return page;
  }
}

import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/page/oauth_page.dart';
import 'package:hi_github/page/root_page.dart';
import 'package:hi_github/page/tabbar_page.dart';
import 'package:hi_github/page/test_page.dart';
import '../core/constant.dart';
import '../page/login_page.dart';
import 'host.dart';

extension UriRouter on Uri {
  // String? defaultTitle(BuildContext? context) {
  //   if (host.isEmpty) {
  //     return null;
  //   }
  //   String? title;
  //   switch (host) {
  //     case HiPath.login:
  //       title = context?.string.login;
  //       break;
  //     case HiPath.about:
  //       title = context?.string.about;
  //       break;
  //     case HiPath.test:
  //       title = context?.string.test;
  //       break;
  //     default:
  //       break;
  //   }
  //   return title;
  // }

  Widget? page(
      {BuildContext? context, Map<String, dynamic> parameters = const {}}) {
    if (host.isEmpty) {
      // return const WelcomePage2();
      return RootPage(parameters: parameters);
    }
    Widget? page;
    switch (host) {
      case HiHost.login:
        page = LoginPage(parameters: parameters);
        break;
      case HiHost.home:
        page = const TabBarPage();
        break;
      // case HiRouterPath.profile:
      //   page = const ProfilePage();
      //   break;
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

import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/page/about_page.dart';
import 'package:hi_github/page/login_page.dart';
import 'package:hi_github/page/oauth_page.dart';
import 'package:hi_github/page/tabbar_page.dart';
import 'package:hi_github/page/welcome_page.dart';

import '../core/constant.dart';
import '../extension/build_context.dart';
import '../page/profile_page.dart';
import 'path.dart';

extension UriEx on Uri {
  String? defaultTitle(BuildContext? context) {
    if (host.isEmpty) {
      return null;
    }
    String? title;
    switch (host) {
      case HiRouterPath.login:
        title = context?.string.login;
        break;
      case HiRouterPath.about:
        title = context?.string.about;
        break;
      default:
        break;
    }
    return title;
  }

  Widget? page({Map<String, dynamic> parameters = const {}}) {
    if (host.isEmpty) {
      return const WelcomePage();
    }
    Widget? page;
    switch (host) {
      case HiRouterPath.login:
        page = LoginPage(parameters: parameters);
        break;
      case HiRouterPath.home:
        page = const TabBarPage();
        break;
      case HiRouterPath.profile:
        page = const ProfilePage();
        break;
      case HiRouterPath.about:
        page = const AboutPage();
        break;
      case HiRouterPathEx.oauth:
        page = OAuthPage(url: Github.oauthUrlString(), title: '授权标题');
        break;
      default:
        break;
    }
    return page;
  }
}

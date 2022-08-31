import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

class Github {
  static const appId = 'dfb24ab8629d8f2a8a93';
  static const appSecret = '4ac0b4d8bfd346e82620eb38c0df7418269bc6b8';

  static oauthUrlString() {
    return 'https://github.com/login/oauth/authorize?client_id'
        '=$appId&state=app&'
        "scope=user,repo,gist,notifications,read:org,workflow&"
        "redirect_uri=gsygithubapp://authed";
  }
}

extension HiParameterEx on HiParameter {
  static const clientId = 'client_id';
  static const clientSecret = 'client_secret';
}

extension HiConstantEx on HiConstant {
  static const int _primaryIntValue = 0xFFFF1493;
  static const MaterialColor primarySwatch = MaterialColor(
    _primaryIntValue,
    <int, Color>{
      50: Color(_primaryIntValue),
      100: Color(_primaryIntValue),
      200: Color(_primaryIntValue),
      300: Color(_primaryIntValue),
      400: Color(_primaryIntValue),
      500: Color(_primaryIntValue),
      600: Color(_primaryIntValue),
      700: Color(_primaryIntValue),
      800: Color(_primaryIntValue),
      900: Color(_primaryIntValue),
    },
  );
}

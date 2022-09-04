import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

import '../model/user.dart';
import '../request/github/oauth_request.dart';
import '../request/githubapi/login_request.dart';
import '../request/githubapi/userinfo_request.dart';
import 'constant.dart';

ThemeData getThemeData(MaterialColor color) {
  return ThemeData(
    primarySwatch: color,
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    primaryColor: Colors.white,
    // backgroundColor: Colors.green,
    scaffoldBackgroundColor: Colors.grey[200],
    appBarTheme: const AppBarTheme(
      elevation: 0.5,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[200],
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        backgroundColor: MaterialStateProperty.all(Colors.black54),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.orange,
    ),
    primaryIconTheme: const IconThemeData(
      color: Colors.red,
    ),
    textTheme: const TextTheme(
      // 全黑色
      displayLarge: TextStyle(
        fontSize: HiConstant.largeFontSize,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: HiConstant.mediumFontSize,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      displaySmall: TextStyle(
        fontSize: HiConstant.smallFontSize,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      // Card's title
      titleMedium: TextStyle(
        fontSize: HiConstant.mediumFontSize - 1,
        color: Colors.black87,
      ),
      // Card's detail
      bodyMedium: TextStyle(
        fontSize: HiConstant.mediumFontSize - 2,
        color: Colors.black54,
      ),
    ),
    cardTheme: const CardTheme(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
    primaryTextTheme: TextTheme(
      // 主题色
      displayLarge: TextStyle(
        fontSize: HiConstant.largeFontSize,
        color: color,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: HiConstant.mediumFontSize,
        color: color,
        fontWeight: FontWeight.normal,
      ),
      displaySmall: TextStyle(
        fontSize: HiConstant.smallFontSize,
        color: color,
        fontWeight: FontWeight.w400,
      ),
      // // 主题色
      // titleLarge: TextStyle(
      //   fontSize: HiConstant.largeFontSize,
      //   color: color,
      //   fontWeight: FontWeight.w500,
      // ),
      // titleMedium: TextStyle(
      //   fontSize: HiConstant.mediumFontSize,
      //   color: color,
      //   fontWeight: FontWeight.normal,
      // ),
      // titleSmall: TextStyle(
      //   fontSize: HiConstant.smallFontSize,
      //   color: color,
      //   fontWeight: FontWeight.w400,
      // ),
    ),
    dividerTheme: DividerThemeData(
      thickness: 0.5,
      color: Colors.grey[200],
    ),
    indicatorColor: Colors.grey,
    tabBarTheme: TabBarTheme(
      labelColor: color,
      unselectedLabelColor: Colors.black,
      labelStyle: const TextStyle(fontSize: 14),
      unselectedLabelStyle: const TextStyle(fontSize: 14),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: color,
    ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.green,
    //   // systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
    //   //   systemNavigationBarContrastEnforced: true,
    //   //   systemStatusBarContrastEnforced: true,
    //   //   systemNavigationBarColor: Colors.white,
    //   //   statusBarColor: color,
    //   //   systemNavigationBarDividerColor: Colors.green,
    //   // ),
    // ),
    // 如果需要去除对应的水波纹效果
    // splashFactory: NoSplash.splashFactory,
    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(splashFactory: NoSplash.splashFactory),
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(splashFactory: NoSplash.splashFactory),
    // ),
  );
}

Future<HiUser> customLogin(Map<String, dynamic> parameters) async {
  log('自定义登录逻辑');
  var code = parameters.stringForKey(HiParameter.code);
  if (code == null) {
    throw HiUnknownError();
  }
  OAuthRequest oauthRequest = OAuthRequest();
  oauthRequest
      .add(HiParameter.code, code)
      .add(HiParameterEx.clientId, Github.appId)
      .add(HiParameterEx.clientSecret, Github.appSecret);
  oauthRequest.set('Accept', 'application/json');
  var base = await HiNet.shared().fire(oauthRequest);
  var token = base.data as String?;
  if (token == null) {
    throw HiUnknownError();
  }
  LoginRequest loginRequest = LoginRequest();
  loginRequest.set('Authorization', 'token $token');
  base = await HiNet.shared().fire(loginRequest);
  log('base: $base');
  var json = base.json as Map<String, dynamic>?;
  if (json?.isEmpty ?? true) {
    throw HiUnknownError();
  }
  var user = User.fromJson(json!);
  HiCache.shared().setString(HiKey.token, token);
  return user;
}

Future<HiUser> customUserinfo(Map<String, dynamic> parameters) async {
  UserinfoRequest request = UserinfoRequest();
  var base = await HiNet.shared().fire(request);
  log('base: $base');
  var json = base.json as Map<String, dynamic>?;
  if (json?.isEmpty ?? true) {
    throw HiUnknownError();
  }
  var user = User.fromJson(json!);
  return user;
}

Uri customDefaultQuerie(Uri uri) {
  Map<String, String> defaults = {};
  switch (uri.host) {
    case HiHost.login:
      defaults = {
        HiParameter.routerMode: HiRouterMode.present.instanceName,
      };
      break;
    default:
      break;
  }
  return uri.addIfNotExist(queries: defaults);
}

bool customCheckLogin() {
  return true;
}

bool customNeedLogin(Uri uri) {
  return false;
}

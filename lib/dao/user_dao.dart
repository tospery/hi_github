import 'package:hi_flutter/hi_flutter.dart';

import '../core/constant.dart';
import '../model/user.dart';
import '../request/github/oauth_request.dart';
import '../request/githubapi/login_request.dart';
import '../request/githubapi/userinfo_request.dart';

class UserDao {
  static Future<String> oauth(String code) async {
    OAuthRequest request = OAuthRequest();
    request
        .add(HiParameter.code, code)
        .add(HiParameterEx.clientId, Github.appId)
        .add(HiParameterEx.clientSecret, Github.appSecret);
    request.set('Accept', 'application/json');
    var base = await HiNet.shared().fire(request);
    var token = base.data as String?;
    if (token?.isEmpty ?? true) {
      throw HiUnknownError();
    }
    return token!;
  }

  static Future<User> login(String token) async {
    LoginRequest request = LoginRequest();
    request.set('Authorization', 'token $token');
    var base = await HiNet.shared().fire(request);
    log('base: $base');
    var json = base.json as Map<String, dynamic>?;
    if (json?.isEmpty ?? true) {
      throw HiUnknownError();
    }
    var user = User.fromJson(json!);
    return user;
  }

  static Future<User> userinfo() async {
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
}

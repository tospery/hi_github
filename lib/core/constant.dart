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

import 'package:hi_flutter/hi_flutter.dart';

class GithubApiRequest extends HiBaseRequest {
  @override
  String urlString() {
    if (needLogin()) {
      set('Authorization', 'token ${HiCache.shared().get(HiKey.token)}');
    }
    return super.urlString();
  }

  @override
  String host() => 'api.github.com';

  @override
  HiHttpMethod method() => HiHttpMethod.get;

  @override
  bool needLogin() => false;

  @override
  String? path() => null;
}

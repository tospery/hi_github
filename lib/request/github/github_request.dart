import 'package:hi_flutter/hi_flutter.dart';

class GithubRequest extends HiBaseRequest {
  @override
  String host() => 'github.com';

  @override
  HiHttpMethod method() => HiHttpMethod.post;

  @override
  bool needLogin() => false;

  @override
  String? path() => null;
}

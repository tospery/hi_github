import 'package:hi_github/request/github/github_request.dart';

class OAuthRequest extends GithubRequest {
  @override
  String? path() => '/login/oauth/access_token';
}

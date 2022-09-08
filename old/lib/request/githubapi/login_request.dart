import 'package:hi_github/request/githubapi/githubapi_request.dart';

class LoginRequest extends GithubApiRequest {
  @override
  String? path() => '/user';
}

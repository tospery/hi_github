import 'githubapi_request.dart';

class StarredRequest extends GithubApiRequest {
  @override
  String? path() {
    return '/users';
  }
}

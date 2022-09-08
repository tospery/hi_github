import 'githubapi_request.dart';

class EventRequest extends GithubApiRequest {
  @override
  String? path() {
    return '/users';
  }
}

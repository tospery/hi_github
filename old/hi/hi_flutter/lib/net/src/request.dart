import 'core.dart';

abstract class HiBaseRequest {
  var useHttps = true;
  var pathExtra = '';

  /// 请求参数，GET时为queryParameters，POST/JSON时为body
  var parameters = <String, String>{};
  var headers = <String, dynamic>{};
  dynamic data;

  String host();
  String? path();
  HiHttpMethod method();
  bool needLogin();

  String urlString() {
    var fullpath = path() ?? '';

    if (pathExtra.isNotEmpty) {
      if (!fullpath.endsWith('/')) {
        fullpath += '/';
      }
      fullpath += pathExtra;
    }

    Uri uri = _getUri(fullpath);

    return uri.toString();
  }

  HiBaseRequest add(String k, Object? v) {
    parameters[k] = v.toString();
    return this;
  }

  HiBaseRequest set(String k, Object? v) {
    headers[k] = v.toString();
    return this;
  }

  Uri _getUri(String fullpath) {
    Uri uri;
    var method = this.method();
    if (useHttps) {
      if (method == HiHttpMethod.get) {
        uri = Uri.https(host(), fullpath, parameters);
      } else {
        uri = Uri.https(host(), fullpath);
      }
    } else {
      if (method == HiHttpMethod.get) {
        uri = Uri.http(host(), fullpath, parameters);
      } else {
        uri = Uri.http(host(), fullpath);
      }
    }
    return uri;
  }

  @override
  String toString() {
    return '请求: ${urlString()}, $parameters';
  }
}

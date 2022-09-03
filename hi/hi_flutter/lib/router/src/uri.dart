import '../../core/hi_core.dart';

extension HiUriRouterEx on Uri {
  String get hostpath => host + path;

  Uri appending({required Map<String, String> queries}) {
    Map<String, dynamic> parameters = {};
    parameters.addAll(queryParameters);
    parameters.addAll(queries);
    return Uri(
        scheme: scheme, host: host, path: path, queryParameters: parameters);
  }

  Uri appendingIfNotExist({required Map<String, String> queries}) {
    if (queries.isEmpty) {
      return this;
    }
    var parameters = queryParameters;
    parameters = parameters.addIfNotExist(queries);
    return Uri(
        scheme: scheme, host: host, path: path, queryParameters: parameters);
  }
}

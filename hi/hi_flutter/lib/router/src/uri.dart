extension HiUriRouterEx on Uri {
  String get hostpath => host + path;

  Uri appending({required Map<String, String> queries}) {
    var parameters = queryParameters;
    parameters.addAll(queries);
    return Uri(
        scheme: scheme, host: host, path: path, queryParameters: parameters);
  }
}

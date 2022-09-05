typedef HiRouterConfigureFunc = void Function();
typedef HiRouterDefaultQueriesFunc = Uri Function(Uri uri);
typedef HiRouterCheckNeedLoginFunc = bool Function(Uri uri);

class HiRouterConfiguration {
  final HiRouterConfigureFunc? configureFunc;
  final HiRouterDefaultQueriesFunc? defaultQueriesFunc;
  final HiRouterCheckNeedLoginFunc? checkNeedLoginFunc;

  HiRouterConfiguration({
    this.configureFunc,
    this.defaultQueriesFunc,
    this.checkNeedLoginFunc,
  });
}

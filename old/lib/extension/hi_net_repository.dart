import 'package:hi_flutter/hi_flutter.dart';
import '../model/repository.dart';
import '../request/githubapi/starred_request.dart';

extension HiNetRepository on HiNet {
  Future<List<Repository>> staredRepositories(
    String username, {
    int pageIndex = 1,
    int pageSize = 10,
  }) async {
    StarredRequest request = StarredRequest();
    request.pathExtra = '$username/starred';
    request.add('page', pageIndex).add('per_page', pageSize);
    var base = await HiNet.shared().fire(request);
    var json = base.json as List? ?? [];
    var items = json
        .map((e) => Repository.fromJson(e as Map<String, dynamic>? ?? {}))
        .toList();
    return items;
  }
}

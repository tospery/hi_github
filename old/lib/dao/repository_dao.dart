// import 'package:hi_flutter/hi_flutter.dart';
// import 'package:hi_github/model/repository.dart';
// import '../request/githubapi/starred_request.dart';

// class RepositoryDao {
//   static Future<List<Repository>> list(String username,
//       {int pageIndex = 1, int pageSize = 10}) async {
//     StarredRequest request = StarredRequest();
//     request.pathExtra = '$username/starred';
//     request.add('page', pageIndex).add('per_page', pageSize);
//     var base = await HiNet.shared().fire(request);
//     var json = base.json as List? ?? [];
//     var list = json
//         .map((e) => Repository.fromJson(e as Map<String, dynamic>? ?? {}))
//         .toList();
//     return list;
//   }
// }

// import 'package:hi_flutter/hi_flutter.dart';
// import 'package:hi_github/model/repository.dart';

// class RepositoryDbProvider extends HiDbProvider {
//   @override
//   String get tableName => 'Repository';

//   @override
//   Future<List<Repository>> fetch(String key) async {
//     var json = await super.fetch(key);
//     if (json is! List) {
//       return [];
//     }
//     var models = json
//         .map(
//           (e) => Repository.fromJson(e as Map<String, dynamic>? ?? {}),
//         )
//         .toList();
//     return models;
//   }
// }

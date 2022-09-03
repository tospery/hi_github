// import 'package:flutter/material.dart';
// import 'package:hi_flutter/hi_flutter.dart';
// import '../model/portal.dart';

// class PortalListPage extends HiListPage {
//   const PortalListPage({super.key, required super.parameters});

//   @override
//   State<PortalListPage> createState() => PortalListPageState();
// }

// class PortalListPageState extends HiListPageState<Portal, PortalListPage> {
//   @override
//   Future<List<Portal>> requestList(int pageIndex) async {
//     if (path?.isEmpty ?? true) {
//       return [];
//     }
//     var content = await context.assetBundle.loadString(path!);
//     var json = content.jsonObject as List? ?? [];
//     var items = json
//         .map((e) => Portal.fromJson(e as Map<String, dynamic>? ?? {}))
//         .toList();
//     return items;
//   }
// }

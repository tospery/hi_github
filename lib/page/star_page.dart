// import 'package:flutter/material.dart';
// import 'package:hi_flutter/hi_flutter.dart';
// import 'package:hi_github/ex/build_context.dart';
// import 'package:hi_github/model/repository.dart';
// import 'package:hi_github/widget/repository_cell.dart';

// import '../dao/repository_dao.dart';

// class StarPage extends StatefulWidget {
//   const StarPage({Key? key}) : super(key: key);

//   @override
//   State<StarPage> createState() => StarPageState();
// }

// class StarPageState extends HiScrollState2<Repository, StarPage> {
//   @override
//   String get getTitle => context.string.star;

//   @override
//   Widget get contentChild => ListView.builder(
//         physics: const AlwaysScrollableScrollPhysics(),
//         padding: const EdgeInsets.only(top: 0),
//         itemCount: list.length,
//         controller: scrollController,
//         itemBuilder: (context, index) {
//           return RepositoryCell(repository: list[index]);
//         },
//       );

//   @override
//   Future<List<Repository>> getData(int pageIndex) async {
//     var list = await RepositoryDao.list('tospery', pageIndex: pageIndex);
//     return list;
//   }
// }

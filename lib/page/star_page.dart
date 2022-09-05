import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';
import '../extension/hi_net_repository.dart';
import '../item/repository_item.dart';
import '../model/user.dart';

class StarPage extends HiListPage {
  const StarPage({super.key, super.parameters = const {}});

  @override
  State<StarPage> createState() => StarPageState();
}

class StarPageState extends HiListPageState<RepositoryItem, StarPage> {
  var testId = 0;

  @override
  void setup() {
    super.setup();
    setState(() {
      title = parameters.stringForKey(HiParameter.title) ?? context.string.star;
    });
  }

  @override
  Future<List<RepositoryItem>> requestList(int pageIndex) async {
    var user = context.storeStateUser<User>();
    var name = user?.username ?? '';
    var models = await HiNet.shared().staredRepositories(
      name,
      pageIndex: pageIndex,
    );
    var items = models.map((e) => RepositoryItem(model: e)).toList();
    return items;
  }

  @override
  void doPressed(RepositoryItem item, {result}) async {
    // if (testId == 0) {
    // } else if (testId == 1) {
    // } else if (testId == 2) {
    // } else if (testId == 3) {
    // } else if (testId == 4) {}
    // testId += 1;
    // // 测试1
    // var map = <String, dynamic>{};
    // map.addAll({'intValue': 123, 'stringValue': 'abc'});
    // var strString = map.toString();
    // var jsonString = map.toJsonString();
    // log('strString = $strString');
    // log('jsonString = $jsonString}');
    // log('strString == jsonString = ${strString == jsonString}');
    // var json = jsonString.toJsonObject();
    // log('json = $json');

    // var provider = RepositoryDbProvider();
    // var models = await provider.fetch('tospery');
    // log('models.length = ${models.length}');
    // log('');

    // var models = items.map((e) => e.model).toList();
    // var jsonString = models.toJsonString();
    // log('jsonString = $jsonString');
    // await provider.save(context.storeStateUser()?.username ?? '', jsonString);
  }
}



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

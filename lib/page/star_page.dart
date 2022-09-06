import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';
import '../extension/hi_net_repository.dart';
import '../item/repository_item.dart';
import '../model/repository.dart';
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
  Future<List<RepositoryItem>> requestRemote({int pageIndex = 1}) async {
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

    // myTest<Repository>();

    // var repo = Repository(name: 'abc', description: '这是描述');
    // await HiCache.shared().storeObject(repo.name ?? '', repo);

    // var aaa = repo.toString();
    // var bbb = repo.toJson().toString();
    // var ccc = repo.toJson().toJsonString();
    // log('aaa = $aaa');
    // log('bbb = $bbb');
    // log('ccc = $ccc');
    // log('aaa == bbb: ${aaa == bbb}');
    // log('bbb == ccc: ${aaa == bbb}');

    // var json = await HiCache.shared().fetchJson<Repository>('abc');
    // log('json = $json');
    // var repo = Repository.fromJson(json);
    // log('repo.description = ${repo.description}');
  }

  // void myTest<M extends HiModel>() {
  //   log('M.runtimeType = ${M.runtimeType}');
  //   log('M.toString() = ${M.toString()}');
  //   log('M.typeName = ${M.typeName}');
  //   log('M.instanceName = ${M.instanceName}');
  // }
}

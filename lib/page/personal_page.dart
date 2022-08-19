import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

import '../model/user.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => PersonalPageState();
}

// class _RankingTabPageState extends HiBaseTabState<Ranking, Video, RankingTabPage> {

//   @override
//   get contentChild => ListView.builder(
//     physics: const AlwaysScrollableScrollPhysics(),
//     padding: const EdgeInsets.only(top: 10),
//     itemCount: dataList.length,
//     controller: scrollController,
//     itemBuilder: (BuildContext context, int index) => VideoLargeCard(video: dataList[index])
//   );

//   @override
//   Future<Ranking> getData(int pageIndex) async {
//     Ranking result = await RankingDao.get(widget.sort, pageIndex: pageIndex, pageSize: 20);
//     return result;
//   }

//   @override
//   List<Video> parseList(Ranking result) {
//     return result.list;
//   }
// }

class PersonalPageState extends HiRefreshState<User, PersonalPage> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(S.of(context).personal),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           InkWell(
  //             onTap: _login,
  //             child: const Text(
  //               '登录',
  //               style: TextStyle(fontSize: 22),
  //             ),
  //           ),
  //           InkWell(
  //             onTap: _about,
  //             child: const Text(
  //               '关于',
  //               style: TextStyle(fontSize: 22),
  //             ),
  //           ),
  //           InkWell(
  //             onTap: _login,
  //             child: const Text(
  //               '弹窗',
  //               style: TextStyle(fontSize: 22),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // _login() async {
  //   HiRouter.shared().present(context, HiRouterPath.login);
  // }

  // void _about() async {
  // }

  @override
  Widget get contentChild => throw UnimplementedError();

  @override
  Future<List<User>> getData(int pageIndex) {
    // ignore: todo
    // // TODO: implement getData
    throw UnimplementedError();
    //var aaa = UserDbProvider().getObject(key)
  }
}

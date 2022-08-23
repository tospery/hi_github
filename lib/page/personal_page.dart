import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';

import '../redux/app_state.dart';
import '../widget/personal_header.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<APPState>(builder: (context, store) {
      return Scaffold(
        appBar: AppBar(elevation: 0.2, title: Text(context.string.personal)),
        body: RefreshIndicator(
          onRefresh: loadData,
          color: Colors.blue,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: contentChild,
          ),
        ),
      );
    });
  }

  // body: ListView(
  //   padding: const EdgeInsets.only(top: 10),
  //   children: [...buildContentList()],
  // ),

  Widget get contentChild => ListView(
        // padding: const EdgeInsets.only(top: 30),
        children: buildContentList(),
      );

  List<Widget> buildContentList() {
    return [
      const PersonalHeader(),
    ];
  }

  // Widget _buildParallaxView() {
  //   return SliverAppBar(
  //     expandedHeight: 160,
  //     pinned: true,
  //     backgroundColor: Colors.red,
  //     foregroundColor: Colors.green,
  //   );
  // }

  Future<void> loadData() {
    return Future.delayed(const Duration(seconds: 3), () {
      log('abcd1234');
    });
  }

  // Widget _buildHead() {
  //   return Container(
  //     color: Colors.green,
  //     width: 100,
  //     height: 100,
  //   );
  // }
}

// class _PersonalPageState extends HiScrollState<User, PersonalPage> {
//   @override
//   Widget build(BuildContext context) {
//     Widget sp = super.build(context);
//     return StoreBuilder(builder: (context, store) {
//       return sp;
//     });
//   }

//   @override
//   // TODO: implement contentChild
//   Widget get contentChild => throw UnimplementedError();

//   @override
//   Future<List<User>> getData(int pageIndex) {
//     // TODO: implement getData
//     throw UnimplementedError();
//   }
// }



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

// class PersonalPageState extends HiRefreshState<User, PersonalPage> {
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text(S.of(context).personal),
//   //     ),
//   //     body: Center(
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: [
// InkWell(
//   onTap: _login,
//   child: const Text(
//     '登录',
//     style: TextStyle(fontSize: 22),
//   ),
// ),
//   //           InkWell(
//   //             onTap: _about,
//   //             child: const Text(
//   //               '关于',
//   //               style: TextStyle(fontSize: 22),
//   //             ),
//   //           ),
//   //           InkWell(
//   //             onTap: _login,
//   //             child: const Text(
//   //               '弹窗',
//   //               style: TextStyle(fontSize: 22),
//   //             ),
//   //           )
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // _login() async {
//   //   HiRouter.shared().present(context, HiRouterPath.login);
//   // }

//   // void _about() async {
//   // }

//   @override
//   Widget get contentChild => throw UnimplementedError();

//   @override
//   Future<List<User>> getData(int pageIndex) {
//     // ignore: todo
//     // // TODO: implement getData
//     throw UnimplementedError();
//     //var aaa = UserDbProvider().getObject(key)
//   }
// }

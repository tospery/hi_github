import 'package:flutter/material.dart';
import '../base/hi_page.dart';
import '../../../core/hi_core.dart';

abstract class HiScrollPage extends HiPage {
  const HiScrollPage({
    super.key,
    required super.parameters,
  });
}

abstract class HiScrollPageState<M extends HiModel, T extends HiScrollPage>
    extends HiPageState<T> {
  late bool canRefresh;
  late bool canLoadMore;
  late final String? path;

  int pageIndex = 1;
  List<M> list = [];
  ScrollController scrollController = ScrollController();

  @override
  void init() {
    super.init();
    canRefresh = parameters.boolForKey(HiParameter.canRefresh) ?? false;
    canLoadMore = parameters.boolForKey(HiParameter.canLoadMore) ?? false;
    path = parameters.stringForKey(HiParameter.path);
    scrollController.addListener(() {
      if (!canRefresh) {
        return;
      }
      var offset = scrollController.position.maxScrollExtent -
          scrollController.position.pixels;
      if (offset < 200 &&
          !loading &&
          scrollController.position.maxScrollExtent != 0) {
        loadData(loadMore: true);
      }
    });
  }

  @override
  void setup() {
    super.setup();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return super.buildAppBar();
  }

  @override
  Widget buildBody() {
    return canRefresh
        ? RefreshIndicator(
            onRefresh: loadData,
            color: Colors.blue,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: _buildScroll(),
          )
        : _buildScroll();
  }

  Widget _buildScroll() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: buildContent(),
    );
  }

  Widget buildContent();

  @override
  Future<void> loadData({loadMore = false}) async {
    if (loading) {
      log('上次加载还没完成！！！', tag: HiLogTag.frame);
      return;
    }
    loading = true;
    if (!loadMore) {
      pageIndex = 1;
    }
    var currentIndex = pageIndex + (loadMore ? 1 : 0);
    log('开始加载数据loadMore = $loadMore, currentIndex = $currentIndex');
    try {
      var models = await requestList(currentIndex);
      setState(() {
        if (loadMore) {
          list = [...list, ...models];
          if (models.isNotEmpty) {
            pageIndex++;
          }
        } else {
          list = models;
        }
      });
      Future.delayed(const Duration(milliseconds: 200), () {
        loading = false;
      });
    } on HiError catch (e) {
      log(e, tag: HiLogTag.frame);
      loading = false;
      // showWarnToast(e.message);
    }
  }

  Future<List<M>> requestList(int pageIndex);
}


// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// import '../../core/logger.dart';
// import 'hi_scroll_control.dart';

// class HiScrollPage extends StatefulWidget {
//   final Key? scrollKey;
  // final RefreshCallback? onRefresh;
  // final RefreshCallback? onLoadMore;
//   final HiScrollControl? control;
//   final IndexedWidgetBuilder itemBuilder;

//   const HiScrollPage(
//       {super.key,
//       this.scrollKey,
//       this.onRefresh,
//       this.onLoadMore,
//       this.control,
//       required this.itemBuilder});

//   @override
//   State<HiScrollPage> createState() => _HiScrollPageState();
// }

// class _HiScrollPageState extends State<HiScrollPage> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     widget.control?.needLoadMore.addListener(() {
//       try {
//         Future.delayed(const Duration(seconds: 2), () {
//           // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
//           _scrollController.notifyListeners();
//         });
//       } catch (e) {
//         log(e, tag: HiLogTag.frame);
//       }
//     });
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         if (widget.control?.needLoadMore.value ?? false) {
//           widget.onLoadMore?.call();
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       ///GlobalKey，用户外部获取RefreshIndicator的State，做显示刷新
//       key: widget.scrollKey,

//       ///下拉刷新触发，返回的是一个Future
//       onRefresh: widget.onRefresh ?? () async {},
//       child: ListView.builder(
//         ///保持ListView任何情况都能滚动，解决在RefreshIndicator的兼容问题。
//         physics: const AlwaysScrollableScrollPhysics(),

//         ///根据状态返回子孔健
//         itemBuilder: (context, index) {
//           return _getItem(index);
//         },

//         ///根据状态返回数量
//         itemCount: _getCount(),

//         ///滑动监听
//         controller: _scrollController,
//       ),
//     );
//   }

//   int _getCount() {
//     if (widget.control!.needHeader) {
//       return (widget.control!.items.isNotEmpty)
//           ? widget.control!.items.length + 2
//           : widget.control!.items.length + 1;
//     } else {
//       if (widget.control!.items.isEmpty) {
//         return 1;
//       }

//       return (widget.control!.items.isNotEmpty)
//           ? widget.control!.items.length + 1
//           : widget.control!.items.length;
//     }
//   }

//   Widget _getItem(int index) {
//     if (!widget.control!.needHeader &&
//         index == widget.control!.items.length &&
//         widget.control!.items.isNotEmpty) {
//       return _buildProgressIndicator();
//     } else if (widget.control!.needHeader &&
//         index == _getCount() - 1 &&
//         widget.control!.items.isNotEmpty) {
//       return _buildProgressIndicator();
//     } else if (!widget.control!.needHeader && widget.control!.items.isEmpty) {
//       return _buildEmpty();
//     } else {
//       return widget.itemBuilder(context, index);
//     }
//   }

//   Widget _buildEmpty() {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height - 100,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           TextButton(
//             onPressed: () {},
//             child: Container(
//               width: 70,
//               height: 70,
//               color: Colors.red,
//             ),
//             // child: new Image(
//             //     // image: new AssetImage(GSYICons.DEFAULT_USER_ICON),
//             //     width: 70.0,
//             //     height: 70.0),
//           ),
//           const Text(
//             '为空页面',
//             style: TextStyle(fontSize: 18),
//           ),
//         ],
//       ),
//     );
//   }

//   ///上拉加载更多
//   Widget _buildProgressIndicator() {
//     Widget bottomWidget = (widget.control!.needLoadMore.value)
//         ? Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//             SpinKitRotatingCircle(color: Theme.of(context).primaryColor),
//             Container(
//               width: 5.0,
//             ),
//             const Text(
//               '加载更多',
//               style: TextStyle(
//                 color: Color(0xFF121917),
//                 fontSize: 14.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             )
//           ])
//         : Container();
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Center(
//         child: bottomWidget,
//       ),
//     );
//   }
// }

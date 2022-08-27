import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

class HiScrollPage extends StatefulWidget {
  final Key? scrollKey;
  final RefreshCallback? onRefresh;
  final RefreshCallback? onLoadMore;
  final HiScrollControl? control;
  final IndexedWidgetBuilder itemBuilder;

  const HiScrollPage(
      {super.key,
      this.scrollKey,
      this.onRefresh,
      this.onLoadMore,
      this.control,
      required this.itemBuilder});

  @override
  State<HiScrollPage> createState() => _HiScrollPageState();
}

class _HiScrollPageState extends State<HiScrollPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.control?.needLoadMore.addListener(() {
      try {
        Future.delayed(const Duration(seconds: 2), () {
          // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
          _scrollController.notifyListeners();
        });
      } catch (e) {
        log(e, tag: HiLogTag.frame);
      }
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (widget.control?.needLoadMore.value ?? false) {
          widget.onLoadMore?.call();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      ///GlobalKey，用户外部获取RefreshIndicator的State，做显示刷新
      key: widget.scrollKey,

      ///下拉刷新触发，返回的是一个Future
      onRefresh: widget.onRefresh ?? () async {},
      child: ListView.builder(
        ///保持ListView任何情况都能滚动，解决在RefreshIndicator的兼容问题。
        physics: const AlwaysScrollableScrollPhysics(),

        ///根据状态返回子孔健
        itemBuilder: (context, index) {
          return _getItem(index);
        },

        ///根据状态返回数量
        itemCount: _getCount(),

        ///滑动监听
        controller: _scrollController,
      ),
    );
  }

  int _getCount() {
    if (widget.control!.needHeader) {
      return (widget.control!.items.isNotEmpty)
          ? widget.control!.items.length + 2
          : widget.control!.items.length + 1;
    } else {
      if (widget.control!.items.isEmpty) {
        return 1;
      }

      return (widget.control!.items.isNotEmpty)
          ? widget.control!.items.length + 1
          : widget.control!.items.length;
    }
  }

  Widget _getItem(int index) {
    if (!widget.control!.needHeader &&
        index == widget.control!.items.length &&
        widget.control!.items.isNotEmpty) {
      return _buildProgressIndicator();
    } else if (widget.control!.needHeader &&
        index == _getCount() - 1 &&
        widget.control!.items.isNotEmpty) {
      return _buildProgressIndicator();
    } else if (!widget.control!.needHeader && widget.control!.items.isEmpty) {
      return _buildEmpty();
    } else {
      return widget.itemBuilder(context, index);
    }
  }

  Widget _buildEmpty() {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {},
            child: Container(
              width: 70,
              height: 70,
              color: Colors.red,
            ),
            // child: new Image(
            //     // image: new AssetImage(GSYICons.DEFAULT_USER_ICON),
            //     width: 70.0,
            //     height: 70.0),
          ),
          const Text(
            '为空页面',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  ///上拉加载更多
  Widget _buildProgressIndicator() {
    Widget bottomWidget = (widget.control!.needLoadMore.value)
        ? Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            SpinKitRotatingCircle(color: Theme.of(context).primaryColor),
            Container(
              width: 5.0,
            ),
            const Text(
              '加载更多',
              style: TextStyle(
                color: Color(0xFF121917),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ])
        : Container();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: bottomWidget,
      ),
    );
  }
}

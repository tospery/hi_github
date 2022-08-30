// import 'package:flutter/material.dart';
// import '../../../core/hi_core.dart';
// import '../base/hi_state.dart';

import 'package:flutter/material.dart';
import '../../../core/hi_core.dart';
import '../base/hi_state.dart';
import 'hi_scroll_page.dart';

abstract class HiScrollState<M extends HiModel, T extends HiScrollPage>
    extends HiState<T> {
  int pageIndex = 1;
  List<M> list = [];
  ScrollController scrollController = ScrollController();

  Widget buildChildView();
  Future<List<M>> requestList(int pageIndex);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (!widget.canRefresh) {
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
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget buildBodyView() {
    return widget.canRefresh
        ? RefreshIndicator(
            onRefresh: loadData,
            color: Colors.blue,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: _buildScrollView(),
          )
        : _buildScrollView();
  }

  Widget _buildScrollView() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: buildChildView(),
    );
  }

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
}

import 'package:flutter/material.dart';
import 'package:hi_core/hi_core.dart';
import 'package:hi_frame/src/hi_state.dart';

abstract class HiRefreshState<M, T extends StatefulWidget> extends HiState<T>
    with AutomaticKeepAliveClientMixin {
  List<M> list = [];
  int pageIndex = 1;
  bool loading = false;
  ScrollController scrollController = ScrollController();

  Widget get contentChild;

  Future<List<M>> getData(int pageIndex);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      var offset = scrollController.position.maxScrollExtent -
          scrollController.position.pixels;
      if (offset < 300 &&
          !loading &&
          scrollController.position.maxScrollExtent != 0) {
        loadData(loadMore: true);
      }
    });
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: loadData,
      color: Colors.blue,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: contentChild,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

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
      var models = await getData(currentIndex);
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
      Future.delayed(const Duration(milliseconds: 1000), () {
        loading = false;
      });
    } on HiError catch (e) {
      log(e, tag: HiLogTag.frame);
      loading = false;
      // showWarnToast(e.message);
    }
  }

  @override
  bool get wantKeepAlive => true;
}

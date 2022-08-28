import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../core/error.dart';
import '../../core/logger.dart';
import '../redux/app_state.dart';
import 'hi_state.dart';

abstract class HiScrollState<M, T extends StatefulWidget> extends HiState<T>
    with AutomaticKeepAliveClientMixin {
  int pageIndex = 1;
  bool loading = false;
  List<M> list = [];
  ScrollController scrollController = ScrollController();

  Widget buildChildView();
  Future<List<M>> requestList(int pageIndex);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
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
  Widget build(BuildContext context) {
    super.build(context);
    return StoreBuilder<HiAPPState>(
      builder: (context, store) {
        return Scaffold(
          appBar: buildAppBar(),
          body: buildBodyView(),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget buildBodyView() {
    return RefreshIndicator(
      onRefresh: loadData,
      color: Colors.blue,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: buildChildView(),
      ),
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

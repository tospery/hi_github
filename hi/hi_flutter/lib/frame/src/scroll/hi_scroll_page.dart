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
  late String? path;

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

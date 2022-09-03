import 'package:flutter/material.dart';
import '../base/hi_page.dart';
import '../../../core/hi_core.dart';

abstract class HiListPage extends HiPage {
  const HiListPage({
    super.key,
    required super.parameters,
  });
}

abstract class HiListPageState<M extends HiModel, T extends HiListPage>
    extends HiPageState<T> {
  late bool canRefresh;
  late bool canLoadMore;
  late String? path;

  int pageIndex = 1;
  List<M> items = [];
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

  Widget buildContent() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 0),
      itemCount: items.length,
      controller: scrollController,
      itemBuilder: (context, index) => buildCell(items[index]),
    );
  }

  Widget buildCell(M model) {
    return model.cell<M>(callback);
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
    log('$typeName->loadData: loadMore = $loadMore, currentIndex = $currentIndex',
        tag: HiLogTag.frame);
    try {
      var models = await requestList(currentIndex);
      setState(() {
        if (loadMore) {
          items = [...items, ...models];
          if (models.isNotEmpty) {
            pageIndex++;
          }
        } else {
          items = models;
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

  void callback(M model, {dynamic result}) {
    log('点击$model, 结果->$result');
  }
}

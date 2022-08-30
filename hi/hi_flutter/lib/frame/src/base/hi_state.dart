import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../core/hi_core.dart';
import '../extension/build_context.dart';
import '../redux/hi_app_state.dart';
import 'hi_page.dart';

abstract class HiState<T extends HiPage> extends State<T>
    with AutomaticKeepAliveClientMixin {
  bool loading = false;
  HiUser? get user => context.store.state.user;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void setState(VoidCallback fn) {
    if (!mounted) {
      log('页面已销毁，本次setState不执行：${toString()}', tag: HiLogTag.frame);
      return;
    }
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var arguments = context.modalRouteSettingsArguments;
    log('arguments = $arguments, parameters = ${widget.parameters}');
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

  PreferredSizeWidget? buildAppBar() {
    // var title = widget.parameters[HiParameter.title];
    var title = widget.parameters.stringForKey(HiParameter.title);
    return AppBar(
      title: title != null ? Text(title) : null,
    );
  }

  Widget buildBodyView();

  Future<void> loadData({loadMore = false}) async {}

  @override
  bool get wantKeepAlive => true;
}
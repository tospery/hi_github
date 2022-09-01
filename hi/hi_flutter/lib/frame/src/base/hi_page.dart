import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../core/hi_core.dart';
import '../extension/build_context.dart';
import '../redux/hi_app_state.dart';

abstract class HiPage extends StatefulWidget {
  final Map<String, dynamic> parameters;

  const HiPage({super.key, required this.parameters});
}

abstract class HiPageState<T extends HiPage> extends State<T>
    with AutomaticKeepAliveClientMixin {
  late bool hideNavBar;
  late String? title;
  late final Map<String, dynamic> parameters;
  // bool _isInitialized = false;
  bool loading = false;
  HiUser? get user => context.store.state.user;

  @override
  void initState() {
    super.initState();
    init();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setup();
    });
  }

  /// 该方法在build执行前被调用，用于初始化late数据
  void init() {
    log('init被调用');
    parameters = widget.parameters;
    hideNavBar = parameters.boolForKey(HiParameter.hideNavBar) ?? false;
    title = parameters.stringForKey(HiParameter.title);
  }

  /// 该方法在build执行后被调用，需要使用setState来修改数据
  void setup() {
    log('setup被调用');
    // if (_isInitialized) {
    //   return;
    // }
    // _isInitialized = true;
    loadData();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (loadOnceToken) {
  //     return;
  //   }
  //   loadOnceToken = true;
  //   loadData();
  // }

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
    log('看看入参: arguments = $arguments, parameters = ${widget.parameters}');
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
    if (hideNavBar) {
      return null;
    }
    return AppBar(
      title: title?.isNotEmpty ?? false ? Text(title!) : null,
    );
  }

  Widget buildBodyView() {
    return Container();
  }

  Future<void> loadData({loadMore = false}) async {}

  @override
  bool get wantKeepAlive => true;
}

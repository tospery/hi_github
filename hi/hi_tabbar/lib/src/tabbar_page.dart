import 'package:flutter/material.dart';
import 'package:hi_tabbar/src/core.dart';
import 'package:hi_tabbar/src/tabbar.dart';

class HiTabBarPage extends StatefulWidget {
  final HiTabBarPosition position;
  final bool resizeToAvoidBottomPadding;
  final List<Widget>? tabItems;
  final List<Widget>? tabViews;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final Widget? title;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomBar;
  final List<Widget>? footerButtons;
  final ValueChanged<int>? onPageChanged;
  final ValueChanged<int>? onDoublePress;
  final ValueChanged<int>? onSinglePress;

  const HiTabBarPage({
    super.key,
    this.position = HiTabBarPosition.bottom,
    this.tabItems,
    this.tabViews,
    this.backgroundColor,
    this.indicatorColor,
    this.title,
    this.drawer,
    this.bottomBar,
    this.onDoublePress,
    this.onSinglePress,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.resizeToAvoidBottomPadding = true,
    this.footerButtons,
    this.onPageChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HiTabBarPageState createState() => _HiTabBarPageState();
}

class _HiTabBarPageState extends State<HiTabBarPage>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  TabController? _tabController;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: widget.tabItems!.length);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.position == HiTabBarPosition.top) {
      return Scaffold(
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomPadding,
        floatingActionButton:
            SafeArea(child: widget.floatingActionButton ?? Container()),
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        persistentFooterButtons: widget.footerButtons,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: widget.title,
          bottom: TabBar(
              controller: _tabController,
              tabs: widget.tabItems!,
              indicatorColor: widget.indicatorColor,
              onTap: _navigationTapClick),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _navigationPageChanged,
          children: widget.tabViews!,
        ),
        bottomNavigationBar: widget.bottomBar,
      );
    }

    return Scaffold(
      drawer: widget.drawer,
      appBar: widget.title != null
          ? AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: widget.title,
            )
          : null,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _navigationPageChanged,
        children: widget.tabViews!,
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor, //底部导航栏主题颜色
        child: SafeArea(
          child: HiTabBar(
            //TabBar导航标签，底部导航放到Scaffold的bottomNavigationBar中
            controller: _tabController,
            //配置控制器
            tabs: widget.tabItems!,
            indicatorColor: widget.indicatorColor,
            onDoubleTap: _navigationDoubleTapClick,
            onTap: _navigationTapClick, //tab标签的下划线颜色
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  _navigationPageChanged(index) {
    if (_index == index) {
      return;
    }
    _index = index;
    _tabController!.animateTo(index);
    widget.onPageChanged?.call(index);
  }

  _navigationTapClick(index) {
    if (_index == index) {
      return;
    }
    _index = index;
    widget.onPageChanged?.call(index);

    ///不想要动画
    _pageController.jumpTo(MediaQuery.of(context).size.width * index);
    widget.onSinglePress?.call(index);
  }

  _navigationDoubleTapClick(index) {
    _navigationTapClick(index);
    widget.onDoublePress?.call(index);
  }
}

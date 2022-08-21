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
    return Container();
  }
}

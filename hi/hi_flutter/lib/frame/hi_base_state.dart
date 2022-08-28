import 'package:flutter/material.dart';
import '../core/logger.dart';

abstract class HiBaseState<T extends StatefulWidget> extends State<T> {
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

  void loadData() async {}
}

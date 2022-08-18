import 'package:flutter/material.dart';
import 'package:hi_core/hi_core.dart';

abstract class HiState<T extends StatefulWidget> extends State<T> {
  @override
  void setState(VoidCallback fn) {
    if (!mounted) {
      log('页面已销毁，本次setState不执行：${toString()}', tag: HiLogTag.frame);
      return;
    }
    super.setState(fn);
  }
}

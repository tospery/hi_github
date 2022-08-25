import 'package:flutter/material.dart';
import '../core/logger.dart';

abstract class HiState<T extends StatefulWidget> extends State<T> {
  // String get _getTitle;

  @override
  void setState(VoidCallback fn) {
    if (!mounted) {
      log('页面已销毁，本次setState不执行：${toString()}', tag: HiLogTag.frame);
      return;
    }
    super.setState(fn);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text(_getTitle),),
  //   );
  // }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/app.dart';

void main() {
  // 屏幕刷新率和显示率不一致时的优化
  // GestureBinding.instance.resamplingEnabled = true;
  runZonedGuarded(() {
    ErrorWidget.builder = (details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      // 此处仅为展示，正规的实现方式参考 _defaultErrorWidgetBuilder 通过自定义 RenderErrorBox 实现
      return Container(
        color: Colors.red,
      );
    };
    runApp(const App());
  }, (object, stack) {
    log('异常发生object = $object');
    log('异常发生stack = $stack');
  });
}

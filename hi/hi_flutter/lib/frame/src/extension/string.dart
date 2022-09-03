import 'package:flutter/material.dart';

import '../core.dart';

extension HiFrameString on String {
  Widget image({double? width, double? height}) {
    Widget? result;
    try {
      result = Image.asset(
        this,
        width: width,
        height: height,
      );
    } catch (e) {
      result = hiImage(this, width: width, height: height);
    }
    return result;
  }
}

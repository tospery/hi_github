import 'dart:math';
import 'package:flutter/material.dart';

Color get hiRandomColor {
  return Color.fromRGBO(
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
    1,
  );
}

String? hiString(dynamic any) {
  if (any is String) {
    return any;
  }
  if (any is num) {
    return any.toString();
  }
  if (any is bool) {
    return any.toString();
  }
  return null;
}

num? hiNumber(dynamic any) {
  if (any is num) {
    return any;
  }
  if (any is String) {
    return num.parse(any);
  }
  return null;
}

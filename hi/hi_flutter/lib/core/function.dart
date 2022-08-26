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
  dynamic result = any as String?;
  if (result != null) {
    return result;
  }
  result = any as int?;
  if (result != null) {
    return result.toString();
  }
  result = any as bool?;
  if (result != null) {
    return result.toString();
  }
  return null;
}

import 'dart:math';

import 'package:flutter/material.dart';

extension ColorHiCoreEx on Color {
  String get hexString =>
      '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
  Color get onColor => computeLuminance() < 0.5 ? Colors.white : Colors.black;
}

extension ColorsHiCoreEx on Colors {
  static Color get randomColor => Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
}

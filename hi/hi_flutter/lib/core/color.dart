import 'package:flutter/material.dart';
import 'dart:math';

extension HiCoreColorEx on Color {
  static Color get random => Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
}

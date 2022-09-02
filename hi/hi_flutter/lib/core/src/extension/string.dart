import 'dart:convert';
import 'package:flutter/material.dart';
import 'int.dart';

extension HiCoreStringEx on String {
  bool? toBool() {
    if (toLowerCase() == 'true') {
      return true;
    }
    if (toLowerCase() == 'false') {
      return false;
    }
    return toInt()?.toBool();
  }

  int? toInt() => int.tryParse(this);

  double? toDouble() => double.tryParse(this);

  dynamic get jsonObject =>
      isNotEmpty ? json.decode(this) : <String, dynamic>{};

  Color? get color {
    if (length < 7) {
      return null;
    }
    return Color(int.parse(substring(1, 7), radix: 16) + 0xFF000000);

    // Color(int.parse(c,radix:16)).withAlpha(255)
  }
}

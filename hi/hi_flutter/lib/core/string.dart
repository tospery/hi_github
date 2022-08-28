import 'dart:convert';
import 'package:flutter/material.dart';

extension HiCoreString on String {
  dynamic get jsonObject =>
      isNotEmpty ? json.decode(this) : <String, dynamic>{};

  Color? get color {
    if (length < 7) {
      return null;
    }
    return Color(int.parse(substring(1, 7), radix: 16) + 0xFF000000);
  }
}

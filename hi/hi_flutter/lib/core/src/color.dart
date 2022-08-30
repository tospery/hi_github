import 'package:flutter/material.dart';

extension HiCoreColorEx on Color {
  String get hexString =>
      '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}

import 'package:flutter/material.dart';
import '../../../core/hi_core.dart';
import '../cell/hi_cell.dart';

class HiItem<M extends HiModel> {
  final double? width;
  final double? height;
  final M? model;

  HiItem({this.width, this.height, this.model});

  // Widget cell<I extends HiItem>(HiCellPressed<I>? onPressed) {
  //   return HiCell<I>(item: this as I, onPressed: onPressed);
  // }

  Widget cell(HiCellPressed<HiItem>? onPressed) {
    return HiCell<HiItem>(item: this, onPressed: onPressed);
  }

  @override
  String toString() {
    return '$typeName, ${model?.toString()}';
  }
}

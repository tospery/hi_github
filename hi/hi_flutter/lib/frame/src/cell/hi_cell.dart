import 'package:flutter/material.dart';
import '../../../core/hi_core.dart';
import '../item/hi_item.dart';

typedef HiCellPressed<I extends HiItem> = void Function(I item,
    {dynamic result});

class HiCell<I extends HiItem> extends StatefulWidget {
  final I item;
  final HiCellPressed<I>? onPressed;

  const HiCell({super.key, required this.item, this.onPressed});

  @override
  State<HiCell> createState() => HiCellState<I>();
}

class HiCellState<I extends HiItem> extends State<HiCell<I>> {
  late I item;

  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed != null ? widget.onPressed!(item) : null,
      child: Container(
        height: 50,
        color: hiRandomColor,
      ),
    );
  }
}

// class HiCell<M extends HiModel, I extends HiItem<M>> extends StatefulWidget {
//   final I item;

//   const HiCell({super.key, required this.item});

//   @override
//   HiCellState<M, I> createState() => HiCellState<M, I>();
// }

// class HiCellState<M extends HiModel, I extends HiItem<M>>
//     extends State<HiCell<M, I>> {
//   late I item;
//   late HiModel? model;

//   @override
//   void initState() {
//     super.initState();
//     item = widget.item;
//   }

//   @override
//   Widget build(BuildContext context) {
    // return Container(
    //   height: 50,
    //   color: hiRandomColor,
    // );
//   }
// }

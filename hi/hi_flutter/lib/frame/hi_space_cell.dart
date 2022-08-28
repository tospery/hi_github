import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

class HiSpaceCell extends StatefulWidget {
  final HiSpace space;

  const HiSpaceCell({super.key, required this.space});

  @override
  State<HiSpaceCell> createState() => _HiSpaceCellState();
}

class _HiSpaceCellState extends State<HiSpaceCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.space.color.color,
      height: widget.space.height,
    );
  }
}

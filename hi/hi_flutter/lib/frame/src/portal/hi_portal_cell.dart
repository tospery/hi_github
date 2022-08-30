import 'package:flutter/material.dart';
import '../function.dart';
import 'hi_portal.dart';
import '../../../core/hi_core.dart';

class HiPortalCell extends StatefulWidget {
  final HiPortal portal;
  final VoidCallback? onPressed;

  const HiPortalCell({super.key, required this.portal, this.onPressed});

  @override
  State<HiPortalCell> createState() => _HiPortalCellState();
}

class _HiPortalCellState extends State<HiPortalCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 10),
        decoration: BoxDecoration(
          border: hiBorder(
            bottom: widget.portal.separated,
          ),
          color: widget.portal.color?.color,
        ),
        height: widget.portal.height,
      ),
    );
  }
}

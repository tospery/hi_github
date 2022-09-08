import 'package:flutter/material.dart';
import '../cell/hi_cell.dart';
import '../cell/hi_portal_cell.dart';
import '../model/hi_portal.dart';
import 'hi_item.dart';

class HiPortalItem extends HiItem<HiPortal> {
  HiPortalItem({super.width, super.height, super.model});

  @override
  Widget cell(HiCellPressed<HiPortalItem>? onPressed) {
    return HiPortalCell(item: this, onPressed: onPressed);
  }
}

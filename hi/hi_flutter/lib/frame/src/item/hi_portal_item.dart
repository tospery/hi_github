import 'package:flutter/material.dart';
import 'package:hi_flutter/frame/hi_frame.dart';

class HiPortalItem extends HiItem<HiPortal> {
  HiPortalItem({super.width, super.height, super.model});

  //   Widget cell<I extends HiItem>(HiCellPressed<I>? onPressed) {
  //   return HiCell<I>(item: this as I, onPressed: onPressed);
  // }

  // @override
  // Widget cell<M extends HiModel>(HiModelCallback<M>? callback) {
  //   return HiPortalCell2(
  //     portal: this,
  //     onPressed: () => callback != null ? callback(this as M) : null,
  //   );
  // }

  // @override
  // Widget cell<HiPortalItem>(HiCellPressed? onPressed) {
  //   return HiPortalCell(item: this, onPressed: onPressed);
  // }

  @override
  Widget cell(HiCellPressed<HiPortalItem>? onPressed) {
    return HiPortalCell(item: this, onPressed: onPressed);
  }
}

import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/widget/cell/appinfo_cell.dart';

import '../core/datatype.dart';

extension HiModelEx on HiModel {
  Widget cell(ValueChanged<HiModel>? onPressed) {
    if (this is HiPortal) {
      var type = PortalType.fromValue(id ?? '');
      switch (type) {
        case PortalType.appinfo:
          return const AppinfoCell();
        default:
          return HiPortalCell(
            portal: this as HiPortal,
            onPressed: () => onPressed != null ? onPressed(this) : null,
          );
      }
    }
    return Container(
      height: 50,
    );
  }
}

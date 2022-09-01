import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/widget/cell/appinfo_cell.dart';
import 'package:hi_github/widget/cell/unlogined_cell.dart';

import '../core/datatype.dart';

extension HiModelEx on HiModel {
  String? get navigationPath {
    if (this is HiPortal) {
      var type = PortalType.fromValue(id ?? '');
      switch (type) {
        case PortalType.unlogined:
          return '${HiPath.login}?${HiParameter.navigationMode}=present';
        default:
          break;
      }
    }
    return null;
  }

  Widget cell(VoidCallback? onPressed) {
    if (this is HiPortal) {
      var type = PortalType.fromValue(id ?? '');
      switch (type) {
        case PortalType.appinfo:
          return const AppinfoCell();
        case PortalType.unlogined:
          return UnloginedCell(onPressed: onPressed);
        default:
          return HiPortalCell(
            portal: this as HiPortal,
            onPressed: onPressed,
          );
      }
    }
    return Container(
      height: 50,
      color: Colors.red,
    );
  }
}

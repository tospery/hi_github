import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/widget/cell/appinfo_cell.dart';
import 'package:hi_github/widget/cell/unlogined_cell.dart';
import 'package:hi_github/widget/cell/userinfo_cell.dart';

import '../core/datatype.dart';
import '../model/user.dart';

extension HiModelEx on HiModel {
  String? get uriString {
    if (this is HiPortal) {
      var type = PortalType.fromValue(id ?? '');
      switch (type) {
        case PortalType.unlogined:
          return hiUriString(host: HiHost.login, queries: {
            HiParameter.routerMode: HiRouterMode.present.instanceName,
          });
        case PortalType.about:
          return hiUriString(host: HiHost.test);
        default:
          break;
      }
    }
    return null;
  }

  Widget cell({User? user, VoidCallback? onPressed}) {
    if (this is HiPortal) {
      var type = PortalType.fromValue(id ?? '');
      switch (type) {
        case PortalType.appinfo:
          return const AppinfoCell();
        case PortalType.unlogined:
          return UnloginedCell(onPressed: onPressed);
        case PortalType.userinfo:
          return UserinfoCell(user: user);
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

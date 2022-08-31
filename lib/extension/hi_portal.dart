import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/core/datatype.dart';
import 'package:hi_github/widget/card/appinfo_portal_card.dart';

extension HiPortalEx on HiPortal {
  Widget card(ValueChanged<HiPortal>? onPressed) {
    var type = PortalType.fromValue(id ?? '');
    switch (type) {
      case PortalType.appinfo:
        return const AppinfoPortalCard();
      default:
        return HiPortalCard(
          portal: this,
          onPressed: () => onPressed != null ? onPressed(this) : null,
        );
    }
  }
}

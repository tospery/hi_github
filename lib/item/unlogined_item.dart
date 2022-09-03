import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

import '../cell/unlogined_cell.dart';

class UnloginedItem extends HiItem<HiModel> {
  UnloginedItem({super.width, super.height, super.model});

  @override
  String? get target => hiUriString(host: HiHost.login);

  @override
  Widget cell(HiCellPressed<UnloginedItem>? onPressed) {
    return UnloginedCell(item: this, onPressed: onPressed);
  }
}

import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/cell/userinfo_cell.dart';

import '../model/user.dart';

class UserinfoItem extends HiItem<User> {
  UserinfoItem({super.width, super.height, super.model});

  @override
  Widget cell(HiCellPressed<UserinfoItem>? onPressed) {
    return UserinfoCell(item: this, onPressed: onPressed);
  }
}

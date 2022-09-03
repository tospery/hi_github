import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/cell/user_info_cell.dart';

import '../model/user.dart';

class UserInfoItem extends HiItem<User> {
  UserInfoItem({super.width, super.height, super.model});

  @override
  Widget cell(HiCellPressed<UserInfoItem>? onPressed) {
    return UserinfoCell(item: this, onPressed: onPressed);
  }
}

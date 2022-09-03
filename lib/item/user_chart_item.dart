import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../cell/user_chart_cell.dart';
import '../model/user.dart';

class UserChartItem extends HiItem<User> {
  UserChartItem({super.width, super.height, super.model});

  @override
  Widget cell(HiCellPressed<UserChartItem>? onPressed) {
    return UserChartCell(item: this, onPressed: onPressed);
  }
}

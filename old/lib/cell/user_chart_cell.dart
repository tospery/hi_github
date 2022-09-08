import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../item/user_chart_item.dart';
import '../model/user.dart';

class UserChartCell extends HiCell<UserChartItem> {
  const UserChartCell({super.key, required super.item, super.onPressed});

  @override
  UserChartCellState createState() => UserChartCellState();
}

class UserChartCellState extends HiCellState<UserChartItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: context.themeData.colorScheme.primary,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: 120,
          child: SvgPicture.network(
            context.storeStateUser<User>()?.dynamicCardUrlString ?? '',
            allowDrawingOutsideViewBox: true,
            placeholderBuilder: (BuildContext context) => SizedBox(
              width: context.mediaQueryData.size.width,
              height: 120,
              child: Center(
                child: SpinKitRipple(
                  color: context.themeData.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

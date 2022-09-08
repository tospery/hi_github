import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../../extension/build_context.dart';
import '../item/unlogined_item.dart';

class UnloginedCell extends HiCell<UnloginedItem> {
  const UnloginedCell({super.key, required super.item, super.onPressed});

  @override
  UnloginedCellState createState() => UnloginedCellState();
}

class UnloginedCellState extends HiCellState<UnloginedItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed != null ? widget.onPressed!(item) : null,
      child: Container(
        color: context.themeData.colorScheme.primary,
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'res/images/github.png',
              color: context.themeData.colorScheme.onPrimary,
              height: 70,
            ),
            hiSpace(height: 5),
            Text(
              context.string.clickToLogin.capitalize(),
              style: context.themeData.textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

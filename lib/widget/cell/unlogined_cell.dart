import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../../extension/build_context.dart';

class UnloginedCell extends StatefulWidget {
  final VoidCallback? onPressed;

  const UnloginedCell({super.key, this.onPressed});

  @override
  State<UnloginedCell> createState() => _UnloginedCellState();
}

class _UnloginedCellState extends State<UnloginedCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        color: context.themeData.colorScheme.primary,
        height: 200,
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

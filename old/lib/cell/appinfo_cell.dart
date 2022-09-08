import 'package:flutter/material.dart';
import 'package:hi_flutter/core/hi_core.dart';
import 'package:hi_flutter/frame/hi_frame.dart';

class AppinfoCell extends StatefulWidget {
  const AppinfoCell({Key? key}) : super(key: key);

  @override
  State<AppinfoCell> createState() => _AppinfoCellState();
}

class _AppinfoCellState extends State<AppinfoCell> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'res/images/github.png',
            color: context.themeData.colorScheme.onPrimary,
            height: 90,
          ),
          hiSpace(height: 8),
          Text.rich(
            TextSpan(
              style: const TextStyle(height: 1.5),
              children: [
                TextSpan(
                  text: HiPackageManager.shared().name,
                  style: context.themeData.textTheme.displayLarge,
                ),
                const TextSpan(text: '\n'),
                TextSpan(
                  text:
                      'v${HiPackageManager.shared().version}(${HiPackageManager.shared().buildNumber})',
                  style: context.themeData.textTheme.displaySmall,
                ),
              ],
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hi_flutter/core/hi_core.dart';
import 'package:hi_flutter/frame/hi_frame.dart';

class AppinfoCard extends StatefulWidget {
  const AppinfoCard({Key? key}) : super(key: key);

  @override
  State<AppinfoCard> createState() => _AppinfoCardState();
}

class _AppinfoCardState extends State<AppinfoCard> {
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
                  text: HiApp.shared().name,
                  style: context.themeData.textTheme.displayLarge,
                ),
                const TextSpan(text: '\n'),
                TextSpan(
                  text:
                      'v${HiApp.shared().version}(${HiApp.shared().buildNumber})',
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

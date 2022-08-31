import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../../extension/build_context.dart';

class UnloginedCard extends StatefulWidget {
  final VoidCallback? onPressed;

  const UnloginedCard({super.key, this.onPressed});

  @override
  State<UnloginedCard> createState() => _UnloginedCardState();
}

class _UnloginedCardState extends State<UnloginedCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        color: Colors.white,
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'res/images/github.png',
              color: Colors.blue,
              height: 70,
            ),
            hiSpace(height: 5),
            Text(
              context.string.clickToLogin.capitalize(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

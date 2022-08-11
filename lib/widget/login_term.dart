

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hi_github/extension/build_context.dart';

class LoginTerm extends StatelessWidget {
  final bool checked;
  final VoidCallback? onPressed;
  final GestureRecognizer? agreementRecognizer;
  final GestureRecognizer? privacyRecognizer;

  const LoginTerm({super.key, required this.checked, this.onPressed, this.agreementRecognizer, this.privacyRecognizer});


  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black54,
        ),
        child: Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                child: GestureDetector(
                  onTap: onPressed,
                  child: Icon(
                    checked ? Icons.radio_button_checked_outlined : Icons.radio_button_unchecked_outlined,
                    color: Colors.blue,
                    size: 16,
                  ),
                ),
              ),
              TextSpan(
                text: '  ${context.string.readAndAgree}',
              ),
              TextSpan(
                text: '《${context.string.userAgreement}》',
                style: const TextStyle(color: Colors.blue),
                recognizer: agreementRecognizer,
              ),
              const TextSpan(
                text: '、',
              ),
              TextSpan(
                text: '《${context.string.privacyPolicy}》',
                style: const TextStyle(color: Colors.blue),
                recognizer: privacyRecognizer,
              ),
            ],
          ),
          maxLines: 2,
        ),
      ),
    );
  }
}
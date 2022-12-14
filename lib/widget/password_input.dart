import 'package:flutter/material.dart';
import 'package:hi_github/ex/build_context.dart';

class PasswordInput extends StatelessWidget {
  final bool secure;
  final VoidCallback? onSecured;
  final ValueChanged<String>? onChanged;

  const PasswordInput(
      {super.key, required this.secure, this.onSecured, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: SizedBox(
        height: 50,
        child: Stack(
          children: [
            TextField(
              cursorColor: Colors.blue,
              obscureText: secure,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                hintText: context.string.password,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              onChanged: onChanged,
            ),
            Positioned(
              right: 0,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: onSecured,
                child: secure
                    ? Image.asset('res/images/invisible.png')
                    : Image.asset('res/images/visible.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

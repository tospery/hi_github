import 'package:flutter/material.dart';
import 'package:hi_github/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).home)),
      body: const Center(
        child: SizedBox(
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}

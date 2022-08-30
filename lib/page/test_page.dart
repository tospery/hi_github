import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('测试'),
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Card(
            child: Container(
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}

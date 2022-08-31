import 'package:flutter/material.dart';

import 'base/hi_page.dart';

class HiRootPage extends HiPage {
  const HiRootPage({super.key, required super.parameters});

  @override
  State<HiRootPage> createState() => HiRootPageState();
}

class HiRootPageState extends HiPageState<HiRootPage> {
  @override
  Widget buildBodyView() {
    return Container(
      color: Colors.green,
    );
  }
}

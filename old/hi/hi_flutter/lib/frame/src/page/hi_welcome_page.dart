import 'package:flutter/material.dart';
import 'package:hi_flutter/core/hi_core.dart';

import 'hi_page.dart';

class HiWelcomePage extends HiPage {
  const HiWelcomePage({super.key, required super.parameters});

  @override
  State<HiWelcomePage> createState() => HiRootPageState();
}

class HiRootPageState extends HiPageState<HiWelcomePage> {
  @override
  void init() {
    super.init();
    hideNavBar = widget.parameters.boolForKey(HiParameter.hideNavBar) ?? true;
  }
}

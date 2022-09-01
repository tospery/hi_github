import 'package:flutter/material.dart';
import 'package:hi_flutter/core/hi_core.dart';

import 'base/hi_page.dart';

class HiRootPage extends HiPage {
  const HiRootPage({super.key, required super.parameters});

  @override
  State<HiRootPage> createState() => HiRootPageState();
}

class HiRootPageState extends HiPageState<HiRootPage> {
  @override
  void init() {
    super.init();
    hideNavBar = widget.parameters.boolForKey(HiParameter.hideNavBar) ?? true;
  }
}

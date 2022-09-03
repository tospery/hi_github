import 'package:flutter/material.dart';

class HiScrollControl {
  List items = [];
  ValueNotifier<bool> needLoadMore = ValueNotifier(false);
  bool needHeader = false;
}

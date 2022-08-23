import 'package:flutter/material.dart';

extension HiCoreBuildContextEx on BuildContext {
  MediaQueryData get media => MediaQuery.of(this);
  Size get mediaSize => media.size;
}

import 'package:flutter/material.dart';

extension HiCoreBuildContextEx on BuildContext {
  MediaQueryData get mediaQueryData => MediaQuery.of(this);
  AssetBundle get assetBundle => DefaultAssetBundle.of(this);
  ThemeData get themeData => Theme.of(this);
}

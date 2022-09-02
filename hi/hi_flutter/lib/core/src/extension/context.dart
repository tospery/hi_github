import 'package:flutter/material.dart';

extension HiCoreBuildContextEx on BuildContext {
  MediaQueryData get mediaQueryData => MediaQuery.of(this);
  Size get mediaQueryDataSize => mediaQueryData.size;

  AssetBundle get assetBundle => DefaultAssetBundle.of(this);

  ThemeData get themeData => Theme.of(this);

  ModalRoute<Object?>? get modalRoute => ModalRoute.of(this);
  RouteSettings? get modalRouteSettings => modalRoute?.settings;
  Object? get modalRouteSettingsArguments => modalRouteSettings?.arguments;
}

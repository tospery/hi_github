import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/redux/app_state.dart';

import '../generated/l10n.dart';

extension BuildContextEx on BuildContext {
  S get string => S.of(this);
  Store<APPState> get store => StoreProvider.of<APPState>(this);
}

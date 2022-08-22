import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/redux/app_state.dart';

import '../generated/l10n.dart';

extension BuildContextEx on BuildContext {
  S get string => S.of(this);
  Store<APPState> get store => StoreProvider.of(this);
}

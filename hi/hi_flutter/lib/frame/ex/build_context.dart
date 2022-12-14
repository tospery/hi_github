import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_epics_hi/redux_epics_hi.dart';
import '../redux/app_state.dart';

extension HiFrameBuildContextEx on BuildContext {
  Store<HiAPPState> get store => StoreProvider.of<HiAPPState>(this);
}

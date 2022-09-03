import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hi_flutter/core/hi_core.dart';
import 'package:redux_epics_hi/redux_epics_hi.dart';
import '../redux/hi_app_state.dart';

extension HiFrameBuildContextEx on BuildContext {
  Store<HiAPPState> get store => StoreProvider.of<HiAPPState>(this);
  HiAPPState get storeState => store.state;
  HiUser? get storeStateUser => storeState.user;
  bool get storeStateLogin => storeState.login;
}

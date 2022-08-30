import 'package:flutter/material.dart';
import 'package:redux_epics_hi/redux_epics_hi.dart';

final hiThemeDataReducer = combineReducers<ThemeData?>([
  TypedReducer<ThemeData?, RefreshThemeDataAction>(_refreshThemeData),
]);

ThemeData? _refreshThemeData(
    ThemeData? themeData, RefreshThemeDataAction action) {
  themeData = action.themeData;
  return themeData;
}

class RefreshThemeDataAction {
  final ThemeData themeData;

  RefreshThemeDataAction(this.themeData);
}

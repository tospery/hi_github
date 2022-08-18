import 'package:flutter/material.dart';

final themeDataReducer = combineReducers<ThemeData?>([
  TypedReducer<ThemeData?, RefreshThemeDataAction>(_refresh),
]);

class RefreshThemeDataAction {
  final ThemeData themeData;

  RefreshThemeDataAction(this.themeData);
}

ThemeData? _refresh(ThemeData? themeData, RefreshThemeDataAction action) {
  themeData = action.themeData;
  return themeData;
}

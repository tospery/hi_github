import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

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

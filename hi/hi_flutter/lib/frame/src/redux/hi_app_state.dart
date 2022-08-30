import 'package:flutter/material.dart';
import '../../../core/hi_core.dart';
import 'hi_locale_reducer.dart';
import 'hi_login_reducer.dart';
import 'hi_theme_reducer.dart';
import 'hi_user_reducer.dart';

class HiAPPState {
  bool login;
  HiUser? user;
  Locale? locale;
  ThemeData? themeData;

  HiAPPState({
    this.login = false,
    this.user,
    this.locale,
    this.themeData,
  });
}

HiAPPState appReducer(HiAPPState state, action) {
  return HiAPPState(
    login: hiLoginReducer(state.login, action),
    user: hiUserReducer(state.user, action),
    locale: hiLocaleReducer(state.locale, action),
    themeData: hiThemeDataReducer(state.themeData, action),
  );
}

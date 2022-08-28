import 'package:flutter/material.dart';
import '../../core/user.dart';
import 'locale_reducer.dart';
import 'login_reducer.dart';
import 'theme_reducer.dart';
import 'user_reducer.dart';

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
    login: loginReducer(state.login, action),
    user: userReducer(state.user, action),
    locale: localeReducer(state.locale, action),
    themeData: themeDataReducer(state.themeData, action),
  );
}

import 'package:flutter/material.dart';
import 'package:hi_github/redux/locale_reducer.dart';
import 'package:hi_github/redux/login_redux.dart';
import 'package:hi_github/redux/theme_reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

class APPState {
  bool login;
  Locale? locale;
  ThemeData? themeData;

  APPState({this.locale, this.themeData, this.login = false});
}

APPState appReducer(APPState state, action) {
  return APPState(
      locale: localeReducer(state.locale, action),
      themeData: themeDataReducer(state.themeData, action),
      login: loginReducer(state.login, action));
}

// final List<Middleware<GSYState>> middleware = [
//   EpicMiddleware<GSYState>(loginEpic),
//   EpicMiddleware<GSYState>(userInfoEpic),
//   EpicMiddleware<GSYState>(oauthEpic),
//   UserInfoMiddleware(),
//   LoginMiddleware(),
// ];

final List<Middleware<APPState>> middleware = [
  EpicMiddleware<APPState>(oauthEpic),
];

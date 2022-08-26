import 'package:hi_flutter/hi_flutter.dart';

import 'locale_reducer.dart';
import 'login_redux.dart';
import 'theme_reducer.dart';
import 'user_redux.dart';

// class APPState {
//   bool login;
//   User? user;
//   Locale? locale;
//   ThemeData? themeData;

//   APPState({this.login = false, this.user, this.locale, this.themeData});
// }

HiAPPState appReducer(HiAPPState state, action) {
  return HiAPPState(
    login: loginReducer(state.login, action),
    user: userReducer(state.user, action),
    locale: localeReducer(state.locale, action),
    themeData: themeDataReducer(state.themeData, action),
  );
}

// final List<Middleware<GSYState>> middleware = [
//   EpicMiddleware<GSYState>(loginEpic),
//   EpicMiddleware<GSYState>(userInfoEpic),
//   EpicMiddleware<GSYState>(oauthEpic),
//   UserInfoMiddleware(),
//   LoginMiddleware(),
// ];

final List<Middleware<HiAPPState>> middleware = [
  EpicMiddleware<HiAPPState>(loginEpic),
  EpicMiddleware<HiAPPState>(userEpic),
  UserMiddleware(),
];

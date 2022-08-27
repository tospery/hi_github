import 'package:hi_flutter/hi_flutter.dart';

import 'locale_reducer.dart';
import 'login_redux.dart';
import 'theme_reducer.dart';
import 'user_redux.dart';

HiAPPState appReducer(HiAPPState state, action) {
  return HiAPPState(
    login: loginReducer(state.login, action),
    user: userReducer(state.user, action),
    locale: localeReducer(state.locale, action),
    themeData: themeDataReducer(state.themeData, action),
  );
}

final List<Middleware<HiAPPState>> middleware = [
  EpicMiddleware<HiAPPState>(loginEpic),
  EpicMiddleware<HiAPPState>(userEpic),
  UserMiddleware(),
];

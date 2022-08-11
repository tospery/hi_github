
import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

final loginReducer = combineReducers<bool>([
  TypedReducer<bool, LoginResultAction>(_loginResult),
  TypedReducer<bool, LogoutResultAction>(_logoutResult),
]);

bool _loginResult(bool result, LoginResultAction action) {
  // if (action.success == true) {
  //   NavigatorUtils.goHome(action.context);
  // }
  if (action.success) {
    log('登录成功了');
    HiRouter.shared().back(action.context);
  }
  return action.success;
}

bool _logoutResult(bool result, LogoutResultAction action) {
  return true;
}

class LoginResultAction {
  final BuildContext context;
  final bool success;

  LoginResultAction(this.context, this.success);
}

class LogoutResultAction {
  final BuildContext context;

  LogoutResultAction(this.context);
}

class OAuthLoginAction {
  final BuildContext context;
  final String code;

  OAuthLoginAction(this.context, this.code);
}

Stream<dynamic> oauthEpic(Stream<dynamic> actions, EpicStore<APPState> store) {
  Stream<dynamic> _loginIn(
      OAuthLoginAction action, EpicStore<APPState> store) async* {
    log('开始loading');
    // var token = await UserDao.oauth(action.code);
    // var user = await UserDao.login(token);
    // HiCache.shared().setString(HiCacheKey.user, json.encode(user));
    // ignore: use_build_context_synchronously
    yield LoginResultAction(action.context, true);
  }

  return actions
      .whereType<OAuthLoginAction>()
      .switchMap((action) => _loginIn(action, store));
}

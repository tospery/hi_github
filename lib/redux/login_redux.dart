import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../dao/user_dao.dart';
import 'app_state.dart';
import 'user_redux.dart';

final loginReducer = combineReducers<bool>([
  TypedReducer<bool, LoginSuccessAction>(_loginSuccess),
  TypedReducer<bool, LogoutSuccessAction>(_logoutSuccess),
]);

bool _loginSuccess(bool result, LoginSuccessAction action) {
  log('登录成功了');
  // HiRouter.shared().back(action.context);
  HiRouter.shared().navigateTo(action.context, HiRouterPath.home,
      replace: true, clearStack: true);
  return true;
}

bool _logoutSuccess(bool result, LogoutSuccessAction action) {
  log('退出成功了');
  if (action.isManual) {
    HiRouter.shared().present(action.context, HiRouterPath.login);
  } else {
    HiRouter.shared().navigateTo(action.context, HiRouterPath.home,
        replace: true, clearStack: true);
  }
  return false;
}

class LoginSuccessAction {
  final BuildContext context;

  LoginSuccessAction(this.context);
}

class LogoutSuccessAction {
  final BuildContext context;
  final bool isManual;

  LogoutSuccessAction(this.context, this.isManual);
}

class LoginAction {
  final BuildContext context;
  final String code;

  LoginAction(this.context, this.code);
}

Stream<dynamic> loginEpic(Stream<dynamic> actions, EpicStore<APPState> store) {
  Stream<dynamic> _loginIn(
      LoginAction action, EpicStore<APPState> store) async* {
    showToastActivity();
    var token = await UserDao.oauth(action.code);
    var user = await UserDao.login(token);
    HiCache.shared().setString(HiCacheKey.token, token);
    // UserDbProvider().save(user.login, user.toJson().jsonString);
    HiCache.shared().setString(HiCacheKey.user, user.toJson().jsonString);
    hideToastActivity();
    store.dispatch(UpdateUserAction(user));
    // ignore: use_build_context_synchronously
    yield LoginSuccessAction(action.context);
  }

  return actions
      .whereType<LoginAction>()
      .switchMap((action) => _loginIn(action, store));
}

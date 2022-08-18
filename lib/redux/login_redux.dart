import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../dao/user_dao.dart';
import '../provider/user_db_provider.dart';
import 'app_state.dart';
import 'user_redux.dart';

final loginReducer = combineReducers<bool>([
  TypedReducer<bool, LoginResultAction>(_loginResult),
  TypedReducer<bool, LogoutResultAction>(_logoutResult),
]);

bool _loginResult(bool result, LoginResultAction action) {
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
    HiCache.shared().setString(token, HiCacheKey.token);
    UserDbProvider().save(user.login, user.toJson().jsonString);
    (store as Store<APPState>?)?.dispatch(UpdateUserAction(user));
    // ignore: use_build_context_synchronously
    yield LoginResultAction(action.context, true);
  }

  return actions
      .whereType<LoginAction>()
      .switchMap((action) => _loginIn(action, store));
}

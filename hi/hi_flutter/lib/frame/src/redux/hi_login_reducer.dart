import 'package:flutter/material.dart';
import 'package:redux_epics_hi/redux_epics_hi.dart';
import '../../../core/hi_core.dart';
import '../../../router_x/hi_router_x.dart';

final hiLoginReducer = combineReducers<bool>([
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

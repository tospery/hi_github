import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

final hiLoginReducer = combineReducers<bool>([
  TypedReducer<bool, LoginSuccessAction>(_loginSuccess),
  TypedReducer<bool, LogoutSuccessAction>(_logoutSuccess),
]);

bool _loginSuccess(bool result, LoginSuccessAction action) {
  log('登录成功了');
  HiRouter.shared().forward(
    action.context,
    hiUriString(
      host: HiHost.home,
      parameters: {
        HiParameter.routerRoot: true.toString(),
      },
    ),
  );
  return true;
}

bool _logoutSuccess(bool result, LogoutSuccessAction action) {
  log('退出成功了');
  if (action.isManual) {
    HiRouter.shared().forward(
      action.context,
      hiUriString(
        host: HiHost.login,
        parameters: {
          HiParameter.routerMode: HiRouterMode.present.instanceName,
        },
      ),
    );
  } else {
    HiRouter.shared().forward(
      action.context,
      hiUriString(
        host: HiHost.home,
        parameters: {
          HiParameter.routerRoot: true.toString(),
        },
      ),
    );
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

import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_flutter/navigator/src/host.dart';

final hiLoginReducer = combineReducers<bool>([
  TypedReducer<bool, LoginSuccessAction>(_loginSuccess),
  TypedReducer<bool, LogoutSuccessAction>(_logoutSuccess),
]);

bool _loginSuccess(bool result, LoginSuccessAction action) {
  log('登录成功了');
  HiNavigator.shared().forward(
    action.context,
    hiUriString(
      host: HiHost.home,
      parameters: {
        HiParameter.navigationRoot: true.toString(),
      },
    ),
  );
  return true;
}

bool _logoutSuccess(bool result, LogoutSuccessAction action) {
  log('退出成功了');
  if (action.isManual) {
    HiNavigator.shared().forward(
      action.context,
      hiUriString(
        host: HiHost.login,
        parameters: {
          HiParameter.navigationMode: HiNavigationMode.present.instanceName,
        },
      ),
    );
  } else {
    HiNavigator.shared().forward(
      action.context,
      hiUriString(
        host: HiHost.home,
        parameters: {
          HiParameter.navigationRoot: true.toString(),
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

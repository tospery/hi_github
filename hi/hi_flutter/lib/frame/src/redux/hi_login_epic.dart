import 'package:flutter/material.dart';
import 'package:redux_epics_hi/redux_epics_hi.dart';

import '../../../core/hi_core.dart';
import '../../../dialog/hi_dialog.dart';
import '../../../net/hi_net.dart';
import 'hi_app_state.dart';
import 'hi_login_reducer.dart';
import 'hi_user_reducer.dart';

class LoginAction {
  final BuildContext context;
  final String code;

  LoginAction(this.context, this.code);
}

Stream<dynamic> hiLoginEpic(
    Stream<dynamic> actions, EpicStore<HiAPPState> store) {
  Stream<dynamic> _loginIn(
      LoginAction action, EpicStore<HiAPPState> store) async* {
    showToastActivity();
    var user = await HiNet.shared()
        .myLogin(parameters: {HiParameter.code: action.code});
    log('登录成功了！！！！！！');
    hideToastActivity();
    store.dispatch(UpdateUserAction(user));
    // ignore: use_build_context_synchronously
    yield LoginSuccessAction(action.context);
  }

  return actions
      .whereType<LoginAction>()
      .switchMap((action) => _loginIn(action, store));
}

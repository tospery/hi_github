import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/net/hi_net_user.dart';

class LoginAction {
  final BuildContext context;
  final String code;

  LoginAction(this.context, this.code);
}

Stream<dynamic> loginEpic(
    Stream<dynamic> actions, EpicStore<HiAPPState> store) {
  Stream<dynamic> _loginIn(
      LoginAction action, EpicStore<HiAPPState> store) async* {
    showToastActivity();
    var token = await HiNet.shared().oauth(action.code);
    var user = await HiNet.shared().login(token);
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

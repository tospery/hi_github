import 'package:flutter/material.dart';
import 'package:redux_epics_hi/redux_epics_hi.dart';
import '../../../cache/hi_cache.dart';
import '../../../core/hi_core.dart';
import '../../../dialog/hi_dialog.dart';
import '../../../net/hi_net.dart';
import '../../../router/hi_router.dart';
import 'hi_app_state.dart';
import 'hi_user_reducer.dart';

final hiLoginReducer = combineReducers<bool>([
  TypedReducer<bool, DidLoginAction>(_didLogin),
  TypedReducer<bool, DidLogoutAction>(_didLogout),
]);

bool _didLogin(bool result, DidLoginAction action) {
  // 执行为关闭登录页
  if (action.isInitialized) {
    HiRouter.shared().resetRoot(action.context, hiUriString(host: HiHost.home));
  } else {
    HiRouter.shared().back(action.context);
  }
  return true;
}

bool _didLogout(bool result, DidLogoutAction action) {
  log('_logoutSuccess: result = $result, isInitialized = ${action.isInitialized}');
  if (action.isInitialized) {
    HiRouter.shared().resetRoot(action.context, hiUriString(host: HiHost.home));
  } else {
    HiRouter.shared().goLogin(action.context);
  }
  return false;
}

class DidLoginAction {
  final BuildContext context;
  final bool isInitialized;

  DidLoginAction(this.context, this.isInitialized);
}

class DidLogoutAction {
  final BuildContext context;
  final bool isInitialized;

  DidLogoutAction(this.context, this.isInitialized);
}

class LoginAction {
  final BuildContext context;
  final String code;

  LoginAction(this.context, this.code);
}

class LoginMiddleware implements MiddlewareClass<HiAPPState> {
  @override
  void call(Store<HiAPPState> store, dynamic action, NextDispatcher next) {
    if (action is DidLogoutAction) {
      log("*********** DidLogoutAction *********** ");
      HiCache.shared().setBool(HiKey.login, false);
      // UserDao.clearAll(store);
      // CookieManager().clearCookies();
      // SqlManager.close();
      // NavigatorUtils.goLogin(action.context);
    }
    next(action);
  }
}

Stream<dynamic> loginEpic(
  Stream<dynamic> actions,
  EpicStore<HiAPPState> store,
) {
  Stream<dynamic> _loginIn(
      LoginAction action, EpicStore<HiAPPState> store) async* {
    showToastActivity();
    var user =
        await HiNet.shared().login(parameters: {HiParameter.code: action.code});
    HiCache.shared().setBool(HiKey.login, true);
    HiCache.shared().setString(HiKey.user, user.toJson().jsonString);
    hideToastActivity();
    store.dispatch(UpdateUserAction(user));
    // ignore: use_build_context_synchronously
    yield DidLoginAction(action.context, false);
  }

  return actions
      .whereType<LoginAction>()
      .switchMap((action) => _loginIn(action, store));
}

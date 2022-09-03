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
  HiRouter.shared().push(
    action.context,
    hiUriString(
      host: HiHost.home,
      queries: {HiParameter.routerRoot: true.toString()},
    ),
  );
  return true;
}

bool _didLogout(bool result, DidLogoutAction action) {
  log('_logoutSuccess: result = $result, isManual = ${action.isManual}');
  if (action.isManual) {
    HiRouter.shared().present(action.context, hiUriString(host: HiHost.login));
  } else {
    HiRouter.shared().push(
      action.context,
      hiUriString(
        host: HiHost.home,
        queries: {HiParameter.routerRoot: true.toString()},
      ),
    );
  }
  return false;
}

class DidLoginAction {
  final BuildContext context;

  DidLoginAction(this.context);
}

class DidLogoutAction {
  final BuildContext context;
  final bool isManual;

  DidLogoutAction(this.context, this.isManual);
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
    yield DidLoginAction(action.context);
  }

  return actions
      .whereType<LoginAction>()
      .switchMap((action) => _loginIn(action, store));
}

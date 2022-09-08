import 'package:redux_epics_hi/redux_epics_hi.dart';
import '../../../core/hi_core.dart';
import '../../../net/hi_net.dart';
import 'hi_app_state.dart';

final hiUserReducer = combineReducers<HiUser?>([
  TypedReducer<HiUser?, UpdateUserAction>(_updateUser),
]);

HiUser? _updateUser(HiUser? user, action) {
  log('设置用户');
  user = action.user;
  return user;
}

class UpdateUserAction {
  final HiUser? user;

  UpdateUserAction(this.user);
}

class FetchUserAction {}

class UserMiddleware implements MiddlewareClass<HiAPPState> {
  @override
  void call(Store<HiAPPState> store, dynamic action, NextDispatcher next) {
    if (action is UpdateUserAction) {
      log("*********** UserMiddleware *********** ");
    }
    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }
}

Stream<dynamic> userEpic(Stream<dynamic> actions, EpicStore<HiAPPState> store) {
  // Use the async* function to make easier
  Stream<dynamic> _loadUserInfo() async* {
    log("*********** userEpic _loadUserInfo ***********");
    var user = await HiNet.shared().userinfo();
    yield UpdateUserAction(user);
  }

  return actions
      .whereType<FetchUserAction>()
      .debounce(((_) => TimerStream(true, const Duration(milliseconds: 10))))
      .switchMap((action) => _loadUserInfo());
}

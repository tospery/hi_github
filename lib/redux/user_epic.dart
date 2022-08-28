import 'package:hi_flutter/hi_flutter.dart';
import '../dao/user_dao.dart';

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
    var user = await UserDao.userinfo();
    yield UpdateUserAction(user);
  }

  return actions
      .whereType<FetchUserAction>()
      .debounce(((_) => TimerStream(true, const Duration(milliseconds: 10))))
      .switchMap((action) => _loadUserInfo());
}

import 'package:hi_flutter/hi_flutter.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

import '../dao/user_dao.dart';
import '../model/user.dart';
import 'app_state.dart';

final userReducer = combineReducers<User?>([
  TypedReducer<User?, UpdateUserAction>(_updateUser),
]);

User? _updateUser(User? user, action) {
  log('_updateLoaded');
  user = action.user;
  return user;
}

class UpdateUserAction {
  final User? user;

  UpdateUserAction(this.user);
}

class UserMiddleware implements MiddlewareClass<APPState> {
  @override
  void call(Store<APPState> store, dynamic action, NextDispatcher next) {
    if (action is UpdateUserAction) {
      log("*********** UserMiddleware *********** ");
    }
    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }
}

class FetchUserAction {}

Stream<dynamic> userEpic(
    Stream<dynamic> actions, EpicStore<APPState> store) {
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

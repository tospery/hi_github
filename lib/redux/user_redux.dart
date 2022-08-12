import 'package:hi_flutter/hi_flutter.dart';
import 'package:redux/redux.dart';

import '../model/user.dart';

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

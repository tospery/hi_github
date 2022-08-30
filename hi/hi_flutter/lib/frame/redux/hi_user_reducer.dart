import 'package:redux_epics_hi/redux_epics_hi.dart';
import '../../core/logger.dart';
import '../../core/user.dart';

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

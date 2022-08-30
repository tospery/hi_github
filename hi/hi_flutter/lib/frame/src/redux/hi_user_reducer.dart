import 'package:redux_epics_hi/redux_epics_hi.dart';
import '../../../core/hi_core.dart';

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

import 'package:redux_epics_hi/redux_epics_hi.dart';

import 'hi_app_state.dart';
import 'hi_login_reducer.dart';
import 'hi_user_reducer.dart';

final List<Middleware<HiAPPState>> hiMiddleware = [
  EpicMiddleware<HiAPPState>(loginEpic),
  EpicMiddleware<HiAPPState>(userEpic),
  LoginMiddleware(),
  UserMiddleware(),
];

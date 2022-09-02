import 'package:redux_epics_hi/redux_epics_hi.dart';

import 'hi_app_state.dart';
import 'hi_login_epic.dart';
import 'hi_user_epic.dart';

final List<Middleware<HiAPPState>> hiMiddleware = [
  EpicMiddleware<HiAPPState>(hiLoginEpic),
  EpicMiddleware<HiAPPState>(hiUserEpic),
  UserMiddleware(),
];

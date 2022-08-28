import 'package:hi_flutter/hi_flutter.dart';

import 'login_epic.dart';
import 'user_epic.dart';

final List<Middleware<HiAPPState>> middleware = [
  EpicMiddleware<HiAPPState>(loginEpic),
  EpicMiddleware<HiAPPState>(userEpic),
  UserMiddleware(),
];

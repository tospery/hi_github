import 'package:hi_flutter/hi_flutter.dart';

import 'login_middleware.dart';
import 'user_middleware.dart';

final List<Middleware<HiAPPState>> middleware = [
  EpicMiddleware<HiAPPState>(loginEpic),
  EpicMiddleware<HiAPPState>(userEpic),
  UserMiddleware(),
];

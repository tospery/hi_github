import 'package:hi_flutter/hi_flutter.dart';

import '../model/user.dart';

extension HiUserEx on HiUser {
  User? get real => this as User?;
}

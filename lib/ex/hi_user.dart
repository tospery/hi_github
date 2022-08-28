import 'package:hi_flutter/core/user.dart';

import '../model/user.dart';

extension HiUserEx on HiUser {
  User? get realUser => this as User?;
}

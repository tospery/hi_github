import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

import '../generated/l10n.dart';

extension BuildContextEx on BuildContext {
  S get string => S.of(this);
}

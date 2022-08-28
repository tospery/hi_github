import 'package:flutter/material.dart';

import '../generated/l10n.dart';

extension BuildContextEx on BuildContext {
  S get string => S.of(this);
}

import 'package:flutter/material.dart';
import 'package:hi_flutter/core/hi_core.dart';
import 'package:hi_github/cell/userinfo_cell.dart';

import '../model/user.dart';

class UserinfoItem extends HiModel {
  final User user;

  const UserinfoItem(this.user);

  @override
  Widget cell<M extends HiModel>(HiModelCallback<M>? callback) {
    return UserinfoCell(
      onPressed: (value) {
        if (callback == null) {
          return;
        }
        callback(this as M, result: value);
      },
    );
  }
}

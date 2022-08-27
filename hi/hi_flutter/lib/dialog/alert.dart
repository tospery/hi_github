import 'package:flutter/material.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

enum HiAlertResult {
  ok,
  cancel,
}

extension HiDialogOkCancelResultEx on OkCancelResult {
  HiAlertResult get rawValue {
    HiAlertResult result = HiAlertResult.ok;
    switch (this) {
      case OkCancelResult.ok:
        result = HiAlertResult.ok;
        break;
      case OkCancelResult.cancel:
        result = HiAlertResult.cancel;
        break;
    }
    return result;
  }
}

Future<HiAlertResult> hiAlert({
  required BuildContext context,
  String? title,
  String? message,
  String? ok,
  String? cancel,
}) async {
  OkCancelResult result = OkCancelResult.ok;
  if ((ok?.isNotEmpty ?? false) && (cancel?.isNotEmpty ?? false)) {
    result = await showOkCancelAlertDialog(
      context: context,
      title: title,
      message: message,
      okLabel: ok,
      cancelLabel: cancel,
    );
  } else {
    result = await showOkAlertDialog(
      context: context,
      title: title,
      message: message,
      okLabel: ok,
    );
  }
  return Future<HiAlertResult>.value(result.rawValue);
}

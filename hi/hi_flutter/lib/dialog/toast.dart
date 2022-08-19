import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:fluttertoast/fluttertoast.dart';

Future<void> toast(String message) {
  return EasyLoading.showToast(message);
}

Future<void> showToastActivity({String? title}) {
  return EasyLoading.show(status: title, maskType: EasyLoadingMaskType.clear);
}

Future<void>  hideToastActivity() {
  return EasyLoading.dismiss();
}
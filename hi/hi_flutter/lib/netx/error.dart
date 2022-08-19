import 'package:hi_core/hi_core.dart';

class HiHttpError extends HiError {
  HiHttpError(int code, String message, {dynamic data})
      : super(code, message, data: data);
}

class HiHttpUnloginError extends HiHttpError {
  HiHttpUnloginError({int code = 401, String message = '请先登录'})
      : super(code, message);
}

class HiHttpNeedAuthError extends HiHttpError {
  HiHttpNeedAuthError({int code = 403, String message = '请重新登录'})
      : super(code, message);
}

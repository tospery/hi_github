import '../../core/hi_core.dart';

class HiNetError extends HiError {
  HiNetError(super.code, super.message, {super.data});
}

class HiNetUnloginedError extends HiNetError {
  HiNetUnloginedError() : super(401, '未登录');
}

class HiNetUnauthorizedError extends HiNetError {
  HiNetUnauthorizedError() : super(403, '未授权');
}

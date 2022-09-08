class HiError implements Exception {
  final int code;
  final String message;
  final dynamic data;

  HiError(this.code, this.message, {this.data});
}

class HiUnknownError extends HiError {
  HiUnknownError() : super(1, '未知错误');
}

import '../../core/hi_core.dart';
import 'adapter.dart';
import 'error.dart';
import 'request.dart';
import 'response.dart';

class HiNet {
  static HiNet? _instance;
  static HiNet shared() {
    _instance ??= HiNet._();
    return _instance!;
  }

  HiNet._();

  Future<HiBaseResponse> fire(HiBaseRequest request) async {
    HiBaseResponse? response;
    Object? error;
    try {
      response = await _send(request);
    } on HiHttpError catch (e) {
      log('发生错误1: $e');
      error = e;
      response = e.data;
    } catch (e) {
      log('发生错误2: $e');
      error = e;
    }

    var last = Uri.dataFromString(request.urlString()).pathSegments.last;
    if (error != null) {
      log('响应[$last]: $error', tag: 'HiHttp');
      throw error;
    }
    log('响应[$last]: $response', tag: 'HiHttp');

    var code = response?.code;
    switch (code) {
      case 200:
        return response!;
      case 401:
        throw HiHttpUnloginError();
      case 403:
        throw HiHttpNeedAuthError();
      default:
        throw HiHttpError(code ?? -1, response?.message ?? '', data: response);
    }
  }

  Future<HiBaseResponse> _send(HiBaseRequest request) async {
    log(request, tag: 'HiHttp');
    HiDioAdapter adapter = HiDioAdapter();
    return adapter.send(request);
  }
}

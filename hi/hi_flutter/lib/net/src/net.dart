import '../../core/hi_core.dart';
import 'configuration.dart';
import 'error.dart';
import 'adapter/dio_adapter.dart';
import 'request.dart';
import 'response.dart';

class HiNet {
  HiNetConfiguration? configuration;

  static HiNet? _instance;
  static HiNet shared() {
    _instance ??= HiNet._();
    return _instance!;
  }

  HiNet._();

  Future<void> ready(HiNetConfiguration? configuration) async {
    this.configuration = configuration;
  }

  Future<HiBaseResponse> fire(HiBaseRequest request) async {
    HiBaseResponse? response;
    Object? error;
    try {
      response = await _send(request);
    } on HiNetError catch (e) {
      log('发生错误1: $e');
      error = e;
      response = e.data;
    } catch (e) {
      log('发生错误2: $e');
      error = e;
    }

    var last = Uri.dataFromString(request.urlString()).pathSegments.last;
    if (error != null) {
      log('响应[$last]: $error', tag: HiLogTag.net);
      throw error;
    }
    log('响应[$last]: $response', tag: HiLogTag.net);

    var code = response?.code;
    switch (code) {
      case 200:
        return response!;
      case 401:
        throw HiNetUnloginedError();
      case 403:
        throw HiNetUnauthorizedError();
      default:
        throw HiNetError(code ?? -1, response?.message ?? '', data: response);
    }
  }

  Future<HiBaseResponse> _send(HiBaseRequest request) async {
    log(request, tag: HiLogTag.net);
    HiDioAdapter adapter = HiDioAdapter();
    return adapter.send(request);
  }

  //   Future<User> login(String token) async {
  //   LoginRequest request = LoginRequest();
  //   request.set('Authorization', 'token $token');
  //   var base = await HiNet.shared().fire(request);
  //   log('base: $base');
  //   var json = base.json as Map<String, dynamic>?;
  //   if (json?.isEmpty ?? true) {
  //     throw HiUnknownError();
  //   }
  //   var user = User.fromJson(json!);
  //   return user;
  // }

  Future<HiUser> login({
    Map<String, dynamic> parameters = const {},
  }) async {
    var loginFunc = configuration?.loginFunc;
    if (loginFunc == null) {
      throw HiUnknownError();
    }
    var user = await loginFunc(parameters);
    return user;
  }

  Future<HiUser> userinfo({
    Map<String, dynamic> parameters = const {},
  }) async {
    var userinfoFunc = configuration?.userinfoFunc;
    if (userinfoFunc == null) {
      throw HiUnknownError();
    }
    var user = await userinfoFunc(parameters);
    return user;
  }
}
